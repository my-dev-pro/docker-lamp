# Docker LAMP

A basic LAMP stack environment built using Docker Compose. It consists of the following:

- PHP
- Apache
- MySQL
- phpMyAdmin

## Available PHP Versions

| PHP Version | Status    |
|-------------|-----------|
| 7.3         | Available |
| 7.4         | Available |
| 8.1         | Available |
| 8.2         | Available |
| 8.3         | Available |

# Available Composer Version
latest released version

# Available NodeJS Version
latest released version

## Installation
[comment]: <> (Run docker container)
docker-compose up -d

Your LAMP stack is now ready!! You can access it via `http://localhost`.

## Access to container bash
[comment]: <> (Access to bash command)
docker exec -it mydev-lamp_apache_1 bash# docker-lamp
