#!/bin/bash

token=$(gcloud auth print-access-token)
project=$(gcloud config get-value project | head -n 1)
region=us-central1
gcloud spanner instances list
echo "Project: $project"
echo "Region: $region"
echo "Token: $token"
docker run us-docker.pkg.dev/appintegration-toolkit/images/integrationcli integrations list -p "$project" -r "$region" -t "$token"