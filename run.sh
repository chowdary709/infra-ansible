#!/bin/bash

# ANSI color codes
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Define function to run playbook for a specific role
run_playbook() {
    role=$1
    echo -e "${GREEN}Running Ansible for '$role'...${NC}"
    git pull ; ansible-playbook -i $role.roboshop.internal, -e "role_name=$role" main.yml
}

# Main script
case "$1" in
    1)
        run_playbook "frontend"
        ;;
    2)
        run_playbook "mysql"
        ;;
    3)
        run_playbook "backend"
        ;;
    4)
        run_playbook "prometheus"
        ;;
    *)
        echo "Usage: $0 {1|2|3|4}"
        exit 1
        ;;
esac
