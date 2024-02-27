#!/bin/bash

# Exit script on error
set -e

# Function to start an app
start_app() {
    echo "Starting $1..."
    cd "$1"
    
    # Check if node_modules directory exists and yarn.lock file has not changed
    if [ ! -d "node_modules" ] || [ ! -f ".yarn_install_check" ] || [ "$(find yarn.lock -newer .yarn_install_check)" ]; then
        echo "Installing dependencies for $1..."
        yarn install
        # Create or update the check file to know when the last successful yarn install was
        touch .yarn_install_check
    fi
    
    # Start the app in the background
    yarn start &
    
    # Go back to the root directory
    cd ..
}

# Start each app
start_app "host"
start_app "page1"
start_app "page2"

# Wait for all background jobs to finish
wait
echo "All apps are running."

# Keep the script running to maintain the yarn start processes
tail -f /dev/null
