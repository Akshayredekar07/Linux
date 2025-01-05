#!/bin/bash

# Declare an array to track the deployment status of microservices in different environments
deployment[1]="ServiceA - Development"
deployment[5]="ServiceB - Testing"
deployment[10]="ServiceC - Production"

# Display the deployment status of each service in various environments
echo "Service in Development: ${deployment[1]}"
echo "Service in Testing: ${deployment[5]}"
echo "Service in Production: ${deployment[10]}"

# Show all deployments and the corresponding environments (including gaps in deployment)
echo "All deployments: ${deployment[@]}"
echo "Indices of deployments: ${!deployment[@]}"
echo "Total number of deployments: ${#deployment[@]}"
