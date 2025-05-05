# 🚀 Docker LAMP Stack

![Docker](https://img.shields.io/badge/Docker-Ready-blue)
![PHP](https://img.shields.io/badge/PHP-Multiple%20Versions-brightgreen)
![Apache](https://img.shields.io/badge/Apache-2.4-red)
![MySQL](https://img.shields.io/badge/MySQL-Latest-orange)
![License](https://img.shields.io/badge/License-MIT-green)

A modern, flexible LAMP (Linux, Apache, MySQL, PHP) development environment built using Docker Compose. Perfect for local development with multiple PHP version support, database management, and email testing capabilities.

## 📋 Stack Components

- **Linux**: Alpine/Debian base images
- **Apache**: HTTP server (2.4+)
- **MySQL**: Database server (Latest)
- **PHP**: Multiple version support
- **phpMyAdmin**: Database management
- **Composer**: PHP dependency manager
- **NodeJS**: JavaScript runtime
- **MailHog**: Email testing tool

## 💻 Available PHP Versions

| PHP Version | Status    | Use Case                           |
|-------------|-----------|----------------------------------- |
| 5.6         | Available | Legacy application support         |
| 7.3         | Available | Older projects                     |
| 7.4         | Available | Mainstream support                 |
| 8.0         | Available | Modern applications                |
| 8.1         | Available | Current applications               |
| 8.2         | Available | Current stable version             |
| 8.3         | Available | Latest features & performance      |
| 8.4         | RC        | Release candidate                  |

## 🛠️ Additional Tools

- **Composer**: Latest released version for dependency management
- **NodeJS**: Latest LTS version for JavaScript/frontend development
- **MailHog**: Email testing service with web interface
- **VIM**: Vim Editor with pre-config

## 🚀 Quick Start

### Prerequisites

- Docker and Docker Compose installed on your system
- Basic knowledge of Docker concepts
- Sudo privileges (for automatic host configuration)

### Installation

1. Clone this repository
   ```sh
   git clone https://github.com/yourusername/docker-lamp.git
   cd docker-lamp
   ```

2. Make the run script executable:
   ```sh
   chmod +x bin/*
   ```

3. Choose your PHP version and start the environment:
   ```sh
   bin/start.sh 82  # For PHP 8.2
   ```

The script will:
- Set up the selected PHP version
- **Automatically configure your hosts file** (requires sudo permission)
- Start the Docker containers
- Show you the running containers
- Provide access information

### Switching PHP Versions

The `bin/switch.sh` script makes it easy to switch between different PHP versions:

```sh
bin/switch.sh <php-version>
```

Available PHP version options:
- `56` - PHP 5.6
- `73` - PHP 7.3
- `74` - PHP 7.4
- `80` - PHP 8.0
- `81` - PHP 8.1
- `82` - PHP 8.2
- `83` - PHP 8.3
- `84` - PHP 8.4 (Release Candidate)

Example:
```sh
# Switch to PHP 7.4
bin/switch.sh 74

# Switch to PHP 8.3
bin/switch.sh 83
```

### Host Configuration

The run script automatically adds `localhost.test` to your system's hosts file:
- `/etc/hosts` on Linux
- `/private/etc/hosts` on macOS

For Windows users, the script will display instructions for manually adding the host entry.

### Project Setup

Place your PHP application files in the `html` directory. This folder is mapped to the document root of the Apache server.

### Access Your Application

- Website: [https://localhost.test](https://localhost.test)
- phpMyAdmin: [http://localhost.test:8080](http://localhost.test:8080)
- MailHog: [http://localhost.test:8025](http://localhost.test:8025)

## 🔧 Configuration

### Default MySQL Credentials

- **Host**: mysql
- **User**: root
- **Password**: *defined in docker-compose.yml*

### Email Testing

The environment includes MailHog for email testing with the following configuration:

```
SMTP_HOST: mailhog
SMTP_PORT: 1025
```

All emails sent by your application will be captured by MailHog and can be viewed at [http://localhost.test:8025](http://localhost.test:8025).

## 🖥️ CLI Access

Access the Apache container's command line:

```sh
docker exec -it mydev-lamp_apache_1 bash
```

Common operations:
```sh
# Run Composer
composer install

# Run Node commands
npm install

# PHP version check
php -v
```

## 📝 Logs

View container logs:

```sh
# All containers
docker compose logs

# Specific container
docker compose logs apache
```

## 🛑 Stopping the Environment

```sh
# Stop without removing containers
docker compose stop

# Stop and remove containers
docker compose down

# Stop and remove containers, networks, volumes, and images
docker compose down -v --rmi all
```

## 💡 Troubleshooting

### Common Issues

1. **Sudo password prompt** - When running the script for the first time, you'll be prompted for your sudo password to update the hosts file. This is normal and required for host configuration.

2. **Port conflicts**: If you see errors about ports being in use, check if you have other services running on ports 80, 443, 3306, 8080, or 8025.

3. **Permission issues**: If you encounter permission problems with the html directory, try:
   ```sh
   chmod -R 755 html
   ```

4. **Windows users**: If using Windows, you'll need to manually add the host entry to your hosts file located at `C:\Windows\System32\drivers\etc\hosts`.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🙏 Acknowledgements

- Docker team for excellent container technology
- PHP community for continued language development
- Apache Software Foundation
- MySQL team
