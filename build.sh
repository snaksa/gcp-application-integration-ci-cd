#!/bin/bash

token=$(gcloud auth print-access-token)
project=$(gcloud config get-value project | head -n 1)
region=us-central1
echo "Project: $project"
echo "Region: $region"
echo "Token: $token"
docker run -v /workspace:/workspace us-docker.pkg.dev/appintegration-toolkit/images/integrationcli prefs set -p "$project" -r "$region" -t "$token"
docker run -v /workspace:/workspace us-docker.pkg.dev/appintegration-toolkit/images/integrationcli integrations list