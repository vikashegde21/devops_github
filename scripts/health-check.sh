#!/bin/bash

# Health check script for monitoring
ENDPOINT="http://localhost:3000/api/health"
TIMEOUT=10

response=$(curl -s -w "%{http_code}" -o /tmp/health_response --max-time $TIMEOUT "$ENDPOINT" || echo "000")

if [ "$response" = "200" ]; then
    echo "✅ Health check passed"
    exit 0
else
    echo "❌ Health check failed (HTTP $response)"
    cat /tmp/health_response 2>/dev/null || echo "No response received"
    exit 1
fi