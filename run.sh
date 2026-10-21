#!/usr/bin/env bash
set -euo pipefail

# Always run from the project root
cd "$(dirname "$0")"

# Configure with CMake and Ninja
cmake -S . -B build -G Ninja

# Build the project
cmake --build build

# Run the executable
exec ./build/miniKv
