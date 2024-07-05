#!/bin/bash

token=$(gcloud auth print-access-token)
project=$(gcloud config get-value project | head -n 1)
region=us-central1
echo "Project: $project"
echo "Region: $region"
echo "Token: $token"
echo "Current directory: $(pwd)"
ls -la
docker run us-docker.pkg.dev/appintegration-toolkit/images/integrationcli integrations list -p "$project" -r "$region" -t "$token"
docker run us-docker.pkg.dev/appintegration-toolkit/images/integrationcli integrations apply -f /workspace -e dev --wait=true -p "$project" -r "$region" -t "$token"

#docker run \
#          -v "$(pwd):/workspace" \
#          us-docker.pkg.dev/appintegration-toolkit/images/integrationcli-builder:latest \
#          sh -c '
#            integrationcli prefs set -p "$project" -r "$region" -t "$token" &&
#            integrationcli integrations list &&
#            integrationcli connectors list &&
#            integrationcli authconfigs list
#          '