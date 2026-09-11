#!/bin/bash
set -e

# One command builds both arches and assembles the manifest list
podman build \
  --platform linux/amd64,linux/arm64 \
  --manifest quay.io/openshift-install/cap-token-refresh:multi-latest \
  -f Dockerfile.multi \
  .

# Push the whole manifest list (all arches)
podman manifest push --all \
  quay.io/openshift-install/cap-token-refresh:multi-latest \
  docker://quay.io:443/openshift-install/cap-token-refresh:multi-latest
