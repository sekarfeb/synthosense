#!/bin/bash

# Update package lists and install Redis
apt-get update
apt-get install -y redis-server

# Configure Redis to listen on all network interfaces
sed -i 's/^bind 127.0.0.1/bind 0.0.0.0/' /etc/redis/redis.conf

# Enable Redis service
systemctl enable redis-server
systemctl start redis-server

# Print Redis version to verify installation
redis-cli --version
