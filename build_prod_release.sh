#!/bin/bash
./node_modules/brunch/bin/brunch b -p
MIX_ENV=prod mix phoenix.digest
PORT=4001 MIX_ENV=prod mix release --env=prod
