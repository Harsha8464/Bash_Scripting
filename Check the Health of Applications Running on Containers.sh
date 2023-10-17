#!/bin/bash

# Define the container name or ID you want to check
CONTAINER_NAME_OR_ID="your_container_name_or_id"

# Define the endpoint or command to check the health of the application
# Replace with the specific check for your application (e.g., HTTP endpoint or custom script)
HEALTH_CHECK_CMD="curl -s http://localhost:8080/health"  # Example: HTTP endpoint check

# Run the health check and capture the result
HEALTH_CHECK_RESULT=$(docker exec -t "$CONTAINER_NAME_OR_ID" sh -c "$HEALTH_CHECK_CMD")

# Define a threshold for what is considered a healthy application
HEALTHY_THRESHOLD="OK"  # Adjust this to match the expected healthy response

# Check if the health check result matches the healthy threshold
if [ "$HEALTH_CHECK_RESULT" = "$HEALTHY_THRESHOLD" ]; then
    echo "Application in container $CONTAINER_NAME_OR_ID is healthy."
    exit 0  # Exit with a success code
else
    echo "Application in container $CONTAINER_NAME_OR_ID is not healthy."
    exit 1  # Exit with a non-zero code to indicate a problem
fi
