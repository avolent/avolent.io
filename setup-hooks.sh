#!/usr/bin/env bash

#
# Setup Git Hooks for avolent.io
# Run this after cloning the repository to enable local commit validation
#

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}Setting up Git hooks for avolent.io...${NC}"
echo

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    echo -e "${RED}❌ Error: Not in a git repository${NC}"
    echo "Please run this script from the root of the avolent.io repository"
    exit 1
fi

# Check if .githooks directory exists
if [ ! -d ".githooks" ]; then
    echo -e "${RED}❌ Error: .githooks directory not found${NC}"
    echo "This script should be run from the repository root"
    exit 1
fi

# Make hooks executable
chmod +x .githooks/*

# Configure git to use .githooks
git config core.hooksPath .githooks

# Verify configuration
HOOKS_PATH=$(git config --get core.hooksPath)

if [ "$HOOKS_PATH" = ".githooks" ]; then
    echo -e "${GREEN}✓${NC} Git hooks configured successfully!"
    echo
    echo -e "${BLUE}Active hooks:${NC}"
    echo "  • commit-msg: Validates commit messages before commit"
    echo
    echo -e "${YELLOW}What gets validated:${NC}"
    echo "  • Commit follows conventional commit format"
    echo "  • Type is lowercase (feat, fix, docs, etc.)"
    echo "  • Subject starts with lowercase"
    echo "  • Subject doesn't end with period"
    echo "  • Header is max 100 characters"
    echo
    echo -e "${GREEN}Setup complete!${NC}"
    echo
    echo "Try making a commit to see the hook in action:"
    echo -e "  ${BLUE}git commit -m \"feat: add new feature\"${NC}"
    echo
    echo "See CONTRIBUTING.md for detailed commit guidelines."
else
    echo -e "${YELLOW}⚠${NC} Warning: Hooks may not be configured correctly"
    echo "Expected: .githooks"
    echo "Got: $HOOKS_PATH"
    exit 1
fi
