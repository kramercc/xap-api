#!/bin/bash
set -x

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Source the environment setup script
source "${SCRIPT_DIR}/nbc-setenv.sh"

# Check if the environment setup failed
if [ $? -ne 0 ]; then
    echo "Error occurred. Exiting..."
    exit 1
fi

# Deploy the master space
"${GS_HOME}/bin/gs.sh" pu deploy --properties="${NBC_DEPLOY_PROPERTY_FILE}" --zones="${NBC_ZONES}" nbc-giga-masterspace "${NBC_MASTER_SPACE_PATH}"
