#!/bin/bash

# Function to add host entry to hosts file
add_host_entry() {
  local os_type=$(uname)
  local hosts_file=""
  local host_entry="127.0.0.1 localhost.test"

  # Determine OS and set hosts file path
  if [[ "$os_type" == "Darwin" ]]; then
    # macOS
    hosts_file="/private/etc/hosts"
    echo "Detected macOS, using hosts file: $hosts_file"
  elif [[ "$os_type" == "Linux" ]]; then
    # Linux
    hosts_file="/etc/hosts"
    echo "Detected Linux, using hosts file: $hosts_file"
  else
    # Windows or other
    echo "Automatic host entry for $os_type is not supported."
    echo "Please manually add the following line to your hosts file:"
    echo "$host_entry"
    return 1
  fi

  # Check if entry already exists
  if grep -q "localhost.test" "$hosts_file"; then
    echo "Host entry already exists in $hosts_file - skipping addition"
    return 0
  fi

  # Entry doesn't exist, add it
  echo "Adding host entry to $hosts_file"
  if ! echo "$host_entry" | sudo tee -a "$hosts_file" > /dev/null; then
    echo "Failed to add host entry. Please add manually:"
    echo "$host_entry"
    return 1
  fi
  echo "Host entry added successfully!"

  return 0
}

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
    docker compose up --build
    ;;
  *)
    echo "Invalid PHP version: $1"
    echo "Available versions: 56, 73, 74, 80, 81, 82, 83, 84"
    exit 1
    ;;
esac
