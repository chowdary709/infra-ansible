#!/bin/bash

echo "Running Git Pull..."
git pull

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
