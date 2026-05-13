#!/bin/sh
# Start a simple Python HTTP server to serve static files
python -m http.server 8000 &
# Give the server a moment to start
sleep 2
# Run Cloudflare Tunnel to expose the local server
# The tunnel token should be provided via the CF_TUNNEL_TOKEN environment variable
exec cloudflared tunnel --no-autoupdate --url http://localhost:8000 --token "$CF_TUNNEL_TOKEN"
