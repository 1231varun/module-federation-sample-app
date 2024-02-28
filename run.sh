#!/bin/bash

# Exit script on error
set -e

# Function to start a React app
start_react_app() {
    echo "Starting $1 (React app)..."
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

# Function to start an Angular app
start_angular_app() {
    echo "Starting $1 (Angular app)..."
    cd "$1"
    
    # Check if node_modules directory exists and yarn.lock file has not changed
    if [ ! -d "node_modules" ] || [ ! -f ".yarn_install_check" ] || [ "$(find yarn.lock -newer .yarn_install_check)" ]; then
        echo "Installing dependencies for $1..."
        yarn install
        # Create or update the check file to know when the last successful yarn install was
        touch .yarn_install_check
    fi
    
    # Start the app in the background
    ng serve &
    
    # Go back to the root directory
    cd ..
}

# Start the React apps
start_react_app "host"
start_react_app "page1"
start_react_app "page2"

# Start the Angular app
start_angular_app "page3"

# Wait for all background jobs to finish
wait
echo "All apps are running."

# Keep the script running to maintain the start processes
tail -f /dev/null
