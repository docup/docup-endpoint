.PHONY: endpoints/dev/deploy
endpoints/dev/deploy:
	gcloud endpoints services deploy --project=soilworks-expt-01-266813 openapi-appengine.yaml
