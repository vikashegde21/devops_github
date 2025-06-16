#!/bin/bash

set -e

echo "🏗️  Building Docker image..."

# Build the image
docker build -t webapp-demo:latest .

# Tag for registry
docker tag webapp-demo:latest ghcr.io/vikashegde21/webapp-demo:latest

echo "✅ Build completed successfully!"

# Optional: Run security scan
echo "🔍 Running security scan..."
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock \
  -v $(pwd):/tmp/.cache/ -w /tmp/.cache/ \
  aquasec/trivy image webapp-demo:latest

echo "🚀 Image ready for deployment!"