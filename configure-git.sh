#!/bin/bash
# Script adapted from ChatGPT provided base

# Prompt user for name and email
read -p "Enter your name : " name
read -p "Enter your email: " email

# Configure Git
git config --global user.name "$name"
git config --global user.email "$email"

# Generate SSH key
ssh-keygen -t ed25519 -C "$email"

echo "Git and SSH configuration complete."
echo "Run load-ssh-key.sh to load the generated key."
