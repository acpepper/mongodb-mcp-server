#!/bin/bash

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "Node.js could not be found. Please install Node.js first."
    exit 1
fi

# rebuild the Node.js server
echo "Rebuilding Node.js server..."
npm run build

# Run the MCP Inspector with the Node.js server
echo "Running MCP Inspector with Node.js server..."
npx @modelcontextprotocol/inspector \
    -e MDB_MCP_CONNECTION_STRING="<your connection string here>" \
    -e MDB_MCP_READ_ONLY="true" \
    node dist/index.js
