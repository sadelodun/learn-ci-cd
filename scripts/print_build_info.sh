#!/bin/bash
echo "=== Build Environment Summary ==="
echo "Date: $(date)"
echo "Compiler Version: $(gcc --version | head -n 1)"
echo "Git Branch: $(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo 'Unknown')"
echo "================================"