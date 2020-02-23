.PHONY: endpoints/dev/deploy
endpoints/dev/deploy:
	gcloud endpoints services deploy --project=docup-269111 openapi.yaml
