#!/bin/bash

# Define the repositories to clone
REPOS=(
    "https://github.com/mail4karthickr/RestaurantFinder"
    "https://github.com/mail4karthickr/Checkout.git"
    "https://github.com/mail4karthickr/RestaurantDetails.git"
)

# Define the target directory
TARGET_DIR="../packages"

# Remove the packages folder if it exists
if [ -d "$TARGET_DIR" ]; then
    echo "Removing existing packages folder..."
    rm -rf "$TARGET_DIR"
fi

# Create the packages folder
mkdir -p "$TARGET_DIR"

# Function to clone a repository and set origin remote
clone_repo() {
    local repo_url=$1
    local repo_name=$(basename "$repo_url" .git)
    echo "Cloning $repo_name..."
    git clone "$repo_url" "$TARGET_DIR/$repo_name"
    cd "$TARGET_DIR/$repo_name" || exit
    git remote set-url origin "$repo_url"
    cd - > /dev/null || exit
}

# Export the function for parallel execution
export -f clone_repo
export TARGET_DIR

# Download all repositories in parallel
echo "Cloning repositories in parallel..."
echo "${REPOS[@]}" | xargs -n 1 -P 3 -I {} bash -c 'clone_repo "$@"' _ {}

echo "All repositories have been cloned successfully."