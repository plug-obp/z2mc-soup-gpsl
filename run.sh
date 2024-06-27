#!/bin/bash

pnpm install

trap "exit" INT TERM ERR
trap "kill 0" EXIT

echo "Don't forget to start the LTL3BA service"
pushd node_modules/gpsl/
node src/ltl3ba-service/ltl3ba.js &

popd
node index.js

node soup_gpsl_mc.js ../soup-js/examples/alice-bob0.soup ../gpsl-js/examples/alice-bob_exclusion.gpsl
node soup_gpsl_mc.js ../soup-js/examples/alice-bob1.soup ../gpsl-js/examples/alice-bob_exclusion.gpsl
node soup_gpsl_mc.js ../soup-js/examples/alice-bob2.soup ../gpsl-js/examples/alice-bob_exclusion.gpsl
node soup_gpsl_mc.js ../soup-js/examples/alice-bob3.soup ../gpsl-js/examples/alice-bob_exclusion.gpsl
node soup_gpsl_mc.js ../soup-js/examples/alice-bob4.soup ../gpsl-js/examples/alice-bob_exclusion.gpsl
node soup_gpsl_mc.js ../soup-js/examples/alice-bob5.soup ../gpsl-js/examples/alice-bob_exclusion.gpsl

node soup_gpsl_mc.js ../soup-js/examples/alice-bob0.soup ../gpsl-js/examples/no-deadlock.gpsl
node soup_gpsl_mc.js ../soup-js/examples/alice-bob1.soup ../gpsl-js/examples/no-deadlock.gpsl
node soup_gpsl_mc.js ../soup-js/examples/alice-bob2.soup ../gpsl-js/examples/no-deadlock.gpsl
node soup_gpsl_mc.js ../soup-js/examples/alice-bob3.soup ../gpsl-js/examples/no-deadlock.gpsl
node soup_gpsl_mc.js ../soup-js/examples/alice-bob4.soup ../gpsl-js/examples/no-deadlock.gpsl
node soup_gpsl_mc.js ../soup-js/examples/alice-bob5.soup ../gpsl-js/examples/no-deadlock.gpsl

node soup_gpsl_mc.js ../soup-js/examples/alice-bob0.soup ../gpsl-js/examples/alice-bob_eventuallyOneInCS.gpsl
node soup_gpsl_mc.js ../soup-js/examples/alice-bob1.soup ../gpsl-js/examples/alice-bob_eventuallyOneInCS.gpsl
node soup_gpsl_mc.js ../soup-js/examples/alice-bob2.soup ../gpsl-js/examples/alice-bob_eventuallyOneInCS.gpsl
node soup_gpsl_mc.js ../soup-js/examples/alice-bob3.soup ../gpsl-js/examples/alice-bob_eventuallyOneInCS.gpsl
node soup_gpsl_mc.js ../soup-js/examples/alice-bob4.soup ../gpsl-js/examples/alice-bob_eventuallyOneInCS.gpsl
node soup_gpsl_mc.js ../soup-js/examples/alice-bob5.soup ../gpsl-js/examples/alice-bob_eventuallyOneInCS.gpsl

# node soup_gpsl_mc.js ../soup-js/examples/alice-bob0.soup ../gpsl-js/examples/alice-bob_fairness.gpsl
node soup_gpsl_mc.js ../soup-js/examples/alice-bob1.soup ../gpsl-js/examples/alice-bob_fairness.gpsl
node soup_gpsl_mc.js ../soup-js/examples/alice-bob2.soup ../gpsl-js/examples/alice-bob_fairness.gpsl
node soup_gpsl_mc.js ../soup-js/examples/alice-bob3.soup ../gpsl-js/examples/alice-bob_fairness.gpsl
node soup_gpsl_mc.js ../soup-js/examples/alice-bob4.soup ../gpsl-js/examples/alice-bob_fairness.gpsl
node soup_gpsl_mc.js ../soup-js/examples/alice-bob5.soup ../gpsl-js/examples/alice-bob_fairness.gpsl

# node soup_gpsl_mc.js ../soup-js/examples/alice-bob0.soup ../gpsl-js/examples/alice-bob_idling.gpsl
node soup_gpsl_mc.js ../soup-js/examples/alice-bob1.soup ../gpsl-js/examples/alice-bob_idling.gpsl
node soup_gpsl_mc.js ../soup-js/examples/alice-bob2.soup ../gpsl-js/examples/alice-bob_idling.gpsl
node soup_gpsl_mc.js ../soup-js/examples/alice-bob3.soup ../gpsl-js/examples/alice-bob_idling.gpsl
node soup_gpsl_mc.js ../soup-js/examples/alice-bob4.soup ../gpsl-js/examples/alice-bob_idling.gpsl
node soup_gpsl_mc.js ../soup-js/examples/alice-bob5.soup ../gpsl-js/examples/alice-bob_idling.gpsl