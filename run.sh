#!/bin/bash

# ANSI color codes
#GREEN='\033[0;32m'
#BLUE='\033[0;34m'
#RED='\033[0;31m'
#NC='\033[0m' # No Color
#
#echo -e "${GREEN}Running Git Pull...${NC}"
#git pull
#
#echo -e "${NC}Waiting for 5 seconds...${NC}"
#sleep 5
#
#echo -e "${BLUE}Running Ansible for 'frontend'...${NC}"
#ansible-playbook -i frontend.roboshop.internal, -e role_name=frontend main.yml
#
#
#
#echo -e "${RED}Running Ansible for 'mysql'...${NC}"
#ansible-playbook -i mysql.roboshop.internal, -e role_name=mysql main.yml
#
#
#
#echo -e "${GREEN}Running Ansible for 'backend'...${NC}"
#ansible-playbook -i backend.roboshop.internal, -e role_name=backend main.yml
#
#i will give bash run.sh 1  to run
#
#echo -e "${BLUE}Running Ansible for 'frontend'...${NC}"
#ansible-playbook -i frontend.roboshop.internal, -e role_name=frontend main.yml
#
#i will give bash run.sh 2  to run
#
#echo -e "${RED}Running Ansible for 'mysql'...${NC}"
#ansible-playbook -i mysql.roboshop.internal, -e role_name=mysql main.yml
#
#give script
###################################################

# Define function to run playbook for a specific role
run_playbook() {
    role=$1
    echo "Running Ansible for '$role'..."
    ansible-playbook -i $role.roboshop.internal, -e "role_name=$role" main.yml
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
