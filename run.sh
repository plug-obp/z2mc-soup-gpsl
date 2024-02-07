#!/bin/bash

pnpm install

trap "exit" INT TERM ERR
trap "kill 0" EXIT

echo "Don't forget to start the LTL3BA service"
pushd node_modules/gpsl/
node src/ltl3ba-service/ltl3ba.js &

popd
node index.js

