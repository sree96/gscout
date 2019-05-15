#!/bin/bash
set -e

git checkout 7a631e4fd3d4e7022b1504dacd48ca15e59f47ac

pip install -r requirements.txt

alias gcloud='/root/google-cloud-sdk/bin/gcloud'

echo $G_SCOUT_KEY > keyfile.json

GOOGLE_APPLICATION_CREDENTIALS=$(pwd)/keyfile.json

echo $GOOGLE_APPLICATION_CREDENTIALS

echo "Running gscout for $PROJECT"

echo "Setting project"
gcloud config set project $PROJECT

echo "Running scan"
python gscout.py --project-id "$PROJECT"

echo "Scan complete, results can be found in the ./results folder"
