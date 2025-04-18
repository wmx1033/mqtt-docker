# MQTT Broker Docker Setup

A secure and production-ready MQTT broker implementation using Mosquitto in a Docker container.

## Features
- 🔒 Secure MQTT broker with authentication
- 🌐 WebSocket support for browser-based clients
- 💾 Persistent message storage
- 👥 Pre-configured user accounts
- 📝 Detailed logging
- 🔄 Automatic container restart

## Technical Specifications
- **Base Image**: Ubuntu 22.04
- **MQTT Broker**: Mosquitto
- **Ports**:
  - 1883: MQTT protocol (TCP)
  - 9001: WebSocket protocol (WS)

## Security Features
- Authentication required (anonymous access disabled)
- Password-based authentication
- Secure password file permissions
- Pre-configured user accounts

## Pre-configured Users
The following users are pre-configured with password `123456`:
- `node1` - Node client 1
- `node2` - Node client 2
- `node3` - Node client 3
- `server1` - Server client 1
- `server2` - Server client 2
- `server3` - Server client 3

## Configuration Details
- Authentication: Required
- Password File: `/etc/mosquitto/passwd_file`
- Persistence: Enabled at `/var/lib/mosquitto/`
- Logging: File-based at `/var/log/mosquitto/mosquitto.log`
- PID File: `/run/mosquitto/mosquitto.pid`

## Quick Start
1. Build the Docker image:
   ```bash
   docker build -t my-mqqt .
   ```

2. Run the container:
   ```bash
   docker run -d \
     --name mqtt-broker \
     --restart always \
     -p 1883:1883 \
     -p 9001:9001 \
     my-mqqt
   ```

## Container Management
- **View Logs**: `docker logs mqtt-broker`
- **Stop Container**: `docker stop mqtt-broker`
- **Start Container**: `docker start mqtt-broker`
- **Remove Container**: `docker rm mqtt-broker`

## Security Notes
- Change default passwords in production
- Consider using TLS/SSL for encrypted communication
- Regularly monitor logs for suspicious activity





