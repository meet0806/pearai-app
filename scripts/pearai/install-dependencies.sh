#!/usr/bin/env bash

# Function to execute a command and check its status
execute() {
	local cmd=$1
	local failure_message=$2

	$cmd
	if [ $? -ne 0 ]; then
		echo "Setup | $failure_message"
		exit 1
	fi
}

# Define the submodule directory
submodule_dir="extensions/pearai-submodule"

# Change to the submodule directory and install dependencies
execute "cd $submodule_dir" "Failed to change directory to $submodule_dir"
execute "./scripts/install-and-build.sh" "Failed to install dependencies for the submodule"
execute "cd ../../" "Failed to change back to the root directory"

# Define the PearAI-Roo-Code directory
roo_dir="extensions/PearAI-Roo-Code"
execute "cd $roo_dir" "Failed to change directory to $roo_dir"
execute "npm run install:all" "Failed to install dependencies for the submodule"
execute "npm run build" "Failed to change back to the root directory"

# Install dependencies using npm
execute "npm install" "Failed to install dependencies with npm"

# Success message
echo "Dependencies Installed Completed Successfully! ⭐"
