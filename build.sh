#!/bin/bash

token=$(gcloud auth print-access-token)
project=$(gcloud config get-value project | head -n 1)
region=us-central1
docker run us-docker.pkg.dev/appintegration-toolkit/images/integrationcli integrations list -p "$project" -r "$region" -t "$token"