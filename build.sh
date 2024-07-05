#!/bin/bash

token=$(gcloud auth print-access-token)
project=$(gcloud config get-value project | head -n 1)
region=us-central1
echo "Project: $project"
echo "Region: $region"
echo "Token: $token"
docker run -v us-docker.pkg.dev/appintegration-toolkit/images/integrationcli integrations list -p "$project" -r "$region" -t "$token"
docker run -v us-docker.pkg.dev/appintegration-toolkit/images/integrationcli integrations apply -f . -e dev --wait=true -p "$project" -r "$region" -t "$token"