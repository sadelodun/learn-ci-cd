#!/bin/bash

#Version number defined manually
FW_VERSION="0.1.0"

# Fetch the short Git SHA dynamically. Fallback to "unknown" if Git is missing.
if [ -d .git ] || git rev-parse --git-dir > /dev/null 2>&1; then
    SHA=$(git rev-parse --short HEAD)
else
    SHA="unknown"
fi

# Write the C header file directly
cat <<EOF > include/version.h
#ifndef VERSION_H
#define VERSION_H

#define FW_VERSION "$FW_VERSION"
#define GIT_SHA    "$SHA"

#endif  // VERSION_H
EOF

echo "Generated version.h with FW_VERSION=$FW_VERSION and GIT_SHA=$SHA"