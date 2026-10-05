#!/bin/bash
set -e

REPO_URL="git@github.com:FR8ST7/flutter_exp_9.git"

echo "=== Experiment 9 Deployment Script ==="
echo "Target Repository: $REPO_URL"

# Initialize Git if needed
if [ ! -d ".git" ]; then
    git init
    git branch -M main
fi

# Add Remote if not set
if ! git remote | grep -q "^origin$"; then
    git remote add origin "$REPO_URL"
else
    git remote set-url origin "$REPO_URL"
fi

# Stage and Commit
git add .
git commit -m "Complete Experiment 9 - Accessing APIs Through HTTP" || echo "Nothing to commit"

# Push Main Branch
echo "Pushing main branch..."
git push -u origin main || echo "Main push skipped (Make sure repository exists on GitHub)."

# Publish to gh-pages branch from web directory
echo "Publishing gh-pages branch..."
git subtree push --prefix web origin gh-pages 2>/dev/null || {
    echo "Creating gh-pages branch using git push..."
    TMP_DIR=$(mktemp -d)
    cp -r web/* "$TMP_DIR/"
    cd "$TMP_DIR"
    git init
    git branch -M gh-pages
    git remote add origin "$REPO_URL"
    git add .
    git commit -m "Deploy Experiment 9 to GitHub Pages"
    git push -u origin gh-pages --force || echo "gh-pages push failed."
    rm -rf "$TMP_DIR"
}

echo "=== Deployment Process Finished ==="
echo "Live URL (when deployed): https://fr8st7.github.io/flutter_exp_9/"
