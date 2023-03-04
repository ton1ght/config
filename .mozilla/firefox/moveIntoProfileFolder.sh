#!/bin/bash

# Move this script into your firefox profile
# Execute it everytime you want to apply the changes in your user-overrides.js

rm user-overrides.js
rm user.js
rm updater.sh
rm prefsCleaner.sh

cp ../user-overrides.js user-overrides.js
cp ../user.js user.js
cp ../updater.sh updater.sh
cp ../prefsCleaner.sh prefsCleaner.sh

pkill firefox
./updater.sh -us
./prefsCleaner.sh -s
