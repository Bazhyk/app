#!/bin/bash
docker system prune -f --volumes
docker pull bazhyk/todoappjenkins:latest
docker-compose -f /home/ubuntu/app/docker-compose.yml up -d
