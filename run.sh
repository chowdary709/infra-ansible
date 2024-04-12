#!/bin/bash

# Function to perform git pull
perform_git_pull() {
    echo "Running Git Pull..."
    git pull
}

# Function to run playbook for a specific role
run_playbook() {
    role=$1
    echo "Running Ansible for '$role'..."
    ansible-playbook -i $role.roboshop.internal, -e "role_name=$role" main.yml
}

# Main script
perform_git_pull

case "$1" in
    frontend)
        run_playbook "frontend"
        ;;
    mysql)
        run_playbook "mysql"
        ;;
    backend)
        run_playbook "backend"
        ;;
    prometheus)
        run_playbook "prometheus"
        ;;
    *)
        echo "Usage: $0 {frontend|mysql|backend|prometheus}"
        exit 1
        ;;
esac
