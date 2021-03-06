#!/bin/sh

BUCKET_NAME="XXXXX"
DATASET="XXXXX"
TABLE="XXXXX"

gcloud functions deploy gcsbq \
    --runtime nodejs8 \
    --trigger-resource $BUCKET_NAME \
    --trigger-event google.storage.object.finalize \
    --memory=1024MB \
    --set-env-vars DATASET=$DATASET,TABLE=$TABLE,SCHEMA="./schema.json"
