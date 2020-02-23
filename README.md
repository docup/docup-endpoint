# docup-endpoint

## Login
```shell script
gcloud auth application-default login
```

## Setup ESP

```shell script
./script/setup-esp.sh
```

If you see the message below, type `y`
```shell script
API [run.googleapis.com] not enabled on project [965242496332]. Would 
you like to enable and retry (this will take a few minutes)? (y/N)?
```

You can see the run services like this. `URL` is the endpoint of the service.
 ```shell script
gcloud run services list --platform=managed
```

## Service account
[Service account](https://console.cloud.google.com/iam-admin/serviceaccounts?hl=ja&organizationId=32394268505&orgonly=true&project=docup-269111&supportedpurview=project,organizationId,folder)で`Default compute service account`のアドレスをメモします。
例：`965242496332-compute@developer.gserviceaccount.com`

## Editing openapi.yaml
openapi.yamlの以下の箇所を適宜修正します。

`host`: gcloud runで取得したURLのホスト部分を記載します。例：`docup-endpoint-em2dgo5qcq-an.a.run.app ` 

`x-google-backend.address:` backendとなるapp engineのURLを記載します。例：`https://api-dot-docup-269111.appspot.com`

`x-google-backend.jwt_audience:` [認証情報](https://console.cloud.google.com/apis/credentials?hl=ja&organizationId=32394268505&orgonly=true&project=docup-269111&supportedpurview=project,organizationId,folder)にてIAP の設定時に作成した OAuth クライアント ID に置き換えます。例：`965242496332-f1epc5enp7ji73e6hrq0dphc5sshlmqj.apps.googleusercontent.com`

## Deploy endpoint
```shell script
make endpoints/dev/deploy
```

## Construct ESP
```shell script
gcloud run services update docup-endpoint \
   --set-env-vars ENDPOINTS_SERVICE_NAME=docup-endpoint-em2dgo5qcq-an.a.run.app \
   --platform=managed \
   --project docup-269111
```
