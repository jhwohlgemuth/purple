#! /bin/bash
set -e

./node_modules/.bin/ajv validate \
    --all-errors \
    --spec draft2020 \
    -c ajv-formats \
    -s ./schemas/Metadata.json \
    -r "./schemas/{ApplicationCategory,Artifact,DevelopmentStatus,Keyword,License,OperatingSystem,RuntimePlatform,TargetProduct}.json" \
    -d "metadata.json" || true