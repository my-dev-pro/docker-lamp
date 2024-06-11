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
Latest released version

# Available NodeJS Version
Latest released version

## Installation
[comment]: <> (Run docker container)
`docker-compose up -d`

## Add new local domain in hosts file

ubuntu 22.04 => `nano /etc/hosts` to look like this

`127.0.0.1       localhost.test`

## Use folder with name `html` in the main directory to include your files

Your LAMP stack is now ready!! You can access it via `https://localhost.test` to check which PHP version you running on docker container.

## Access to container bash
[comment]: <> (Access to bash command)
`docker exec -it mydev-lamp_apache_1 bash`
