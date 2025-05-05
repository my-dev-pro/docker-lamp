#!/bin/bash

# Main script
if [ -z "$1" ]; then
  echo "Usage: $0 <php-version>"
  echo "Available PHP versions:"
  echo "  56  - PHP 5.6"
  echo "  73  - PHP 7.3"
  echo "  74  - PHP 7.4"
  echo "  80  - PHP 8.0"
  echo "  81  - PHP 8.1"
  echo "  82  - PHP 8.2"
  echo "  83  - PHP 8.3"
  echo "  84  - PHP 8.4 (RC)"
  exit 1
fi

case "$1" in
  56|73|74|80|81|82|83|84)
    # Create or update .env file with the PHP version
    NEWLINE=$'\n'
    echo "PHP_IMAGE=./php/Dockerfile.apache$1${NEWLINE}PHP_VERSION=$1"> .env
    echo "Setting PHP version to $1"

    # Add host entry to hosts file if not already present
    add_host_entry

    # Restart containers with the new configuration
    docker compose down
	docker compose up
    ;;
  *)
    echo "Invalid PHP version: $1"
    echo "Available versions: 56, 73, 74, 80, 81, 82, 83, 84"
    exit 1
    ;;
esac
