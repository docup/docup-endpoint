#!/bin/bash

# See detail how to setup esp
# https://cloud.google.com/endpoints/docs/openapi/get-started-app-engine-standard?hl=ja#deploy_endpoints_proxy

PROJECT_ID=docup-269111

gcloud config set run/region asia-northeast1

gcloud run deploy docup-endpoint \
    --image="gcr.io/endpoints-release/endpoints-runtime-serverless:1.45.0" \
    --allow-unauthenticated \
    --platform=managed \
    --project=${PROJECT_ID}


