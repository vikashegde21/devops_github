#!/bin/bash

set -e

echo "🚀 Deploying application..."

# Pull latest images
docker-compose pull

# Deploy with zero downtime
docker-compose up -d --remove-orphans

# Wait for health check
echo "🔍 Waiting for application to be healthy..."
timeout 60 bash -c 'until curl -f http://localhost:3000/api/health; do sleep 2; done'

echo "✅ Deployment completed successfully!"

# Start monitoring stack
echo "📊 Starting monitoring stack..."
docker-compose -f monitoring/docker-compose.monitoring.yml up -d

echo "🎉 All services are running!"
echo "Application: http://localhost:3000"
echo "Prometheus: http://localhost:9090"
echo "Grafana: http://localhost:3001 (admin/admin123)"