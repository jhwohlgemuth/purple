#! /bin/bash
set -e

./node_modules/.bin/ajv validate \
    --all-errors \
    --spec draft2020 \
    -c ajv-formats \
    -s ./schemas/Artifact.json \
    -r "./schemas/{ApplicationCategory,DevelopmentStatus,License,OperatingSystem,RuntimePlatform,TargetProduct}.json" \
    -d "metadata.json" || true