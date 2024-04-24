#!/bin/bash

# Configuration
HEALTH_URL="http://10.1.30.1:8080/health"
NTFY_INSTANCE="https://ntfy.lunivity.com"
NTFY_TOPIC="$NTFY_INSTANCE/mytopic"
CONFIGURABLE_MESSAGE="Something went wrong with the health check."
LOG_FILE="health_check.log"

# Function to send push notification
send_notification() {
    local message="$1"
    local priority="$2"
    local tags="$3"
    curl -H "Title: Health Check Failure" \
         -H "Priority: $priority" \
         -H "Tags: $tags" \
         -d "$message" \
         "$NTFY_TOPIC"
    if [ $? -ne 0 ]; then
        echo "[$(date +"%Y-%m-%d %H:%M:%S")] - Failed to send push notification" >> "$LOG_FILE"
    fi
}

# Perform curl request
HEALTH_RESPONSE=$(curl -s -w "%{http_code}" "$HEALTH_URL")
HTTP_CODE=$(echo "$HEALTH_RESPONSE" | tail -n1)
CONTENT=$(echo "$HEALTH_RESPONSE" | head -n -1)
if [ "$HTTP_CODE" == "200" ] && [ "$CONTENT" == "OK" ]; then
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] - Successful response from health check at '$HEALTH_URL' - Response: 'OK'" >> "$LOG_FILE"
else
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] - Failed response from health check at '$HEALTH_URL' - HTTP Code: '$HTTP_CODE' - Content: '$CONTENT'" >> "$LOG_FILE"
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] - Sending a push notification..." >> "$LOG_FILE"
    send_notification "$CONFIGURABLE_MESSAGE" "urgent" "warning"
fi
