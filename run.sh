#!/bin/bash

# ANSI color codes
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}Running Git Pull...${NC}"
git pull

echo -e "${BLUE}Running Ansible for 'frontend'...${NC}"
ansible-playbook -i frontend.roboshop.internal, -e role_name=frontend expense.yml

# Introducing a 5-second delay
echo -e "${NC}Waiting for 2 seconds...${NC}"
sleep 2

echo -e "${RED}Running Ansible for 'mysql'...${NC}"
ansible-playbook -i mysql.roboshop.internal, -e role_name=mysql expense.yml

# Introducing a 5-second delay
echo -e "${NC}Waiting for 2 seconds...${NC}"
sleep 2

echo -e "${GREEN}Running Ansible for 'backend'...${NC}"
ansible-playbook -i backend.roboshop.internal, -e role_name=backend expense.yml

