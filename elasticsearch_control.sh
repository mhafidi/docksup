#!/bin/bash

# Function to check if Elasticsearch container is running
check_elasticsearch() {
  local container_status=$(docker ps --filter "name=elasticsearch" --filter "status=running" --format "{{.ID}}")

  if [ -n "$container_status" ]; then
    echo "Elasticsearch Docker container is already running."
    return 0
  else
    echo "Elasticsearch Docker container is not running."
    return 1
  fi
}

# Function to create and start Elasticsearch Docker container
start_elasticsearch() {
  echo "Starting a new Elasticsearch Docker container..."

  # Pull the latest Elasticsearch image from Docker Hub
  docker pull docker.elastic.co/elasticsearch/elasticsearch:7.10.2

  # Create and start the Elasticsearch container
  docker run -d --name elasticsearch \
    -p 9200:9200 -p 9300:9300 \
    -e "discovery.type=single-node" \
    docker.elastic.co/elasticsearch/elasticsearch:7.10.2

  if [ $? -eq 0 ]; then
    echo "Elasticsearch Docker container started successfully."
  else
    echo "Failed to start Elasticsearch Docker container."
  fi
}

# Function to display the menu
display_menu() {
  echo "Please choose an option:"
  echo "1. Check if Elasticsearch is running"
  echo "2. Create and start a new Elasticsearch instance"
  echo "3. Exit"
  read -p "Enter your choice [1-3]: " choice
}

# Main script execution
while true; do
  display_menu
  case $choice in
    1)
      check_elasticsearch
      ;;
    2)
      start_elasticsearch
      ;;
    3)
      echo "Exiting..."
      exit 0
      ;;
    *)
      echo "Invalid choice. Please enter 1, 2, or 3."
      ;;
  esac
done

