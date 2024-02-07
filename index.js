import { readSoup, evaluateStepString, SoupSemantics } from 'soup';
import { readExpression, ltlToAutomaton, GPSLAutomatonSemantics } from 'gpsl';

import { STR2TR, StepSynchronousProductSemantics, ndfs_gs09_cdlp05 } from 'z2mc';
import { z2mcSemanticsAdaptor, z2mcDependentSemanticsAdaptor } from './z2mc-adaptors.js';

import util from 'util';

const BOUND = 3; const FAIL = true;
//read the model
const soup = readSoup(`var x = 0; inc: [ x < ${BOUND} ] / x = x + 1 | reset: [x >= ${BOUND}] / x = 0`);
//instantiate the model semantics
const soupSemantics = new SoupSemantics(soup);
//adapt to z2mc
const z2mcSemantics = new z2mcSemanticsAdaptor(soupSemantics);

//read the property
const property = readExpression(`[] |x < ${BOUND} + ${FAIL?0:1}|`);
//convert the property to an automaton
const automaton = await ltlToAutomaton(property);
//instantiate the automaton semantics
const automatonSemantics = new GPSLAutomatonSemantics(automaton, evaluateStepString);
//adapt to z2mc
const z2mcDependentSemantics = new z2mcDependentSemanticsAdaptor(automatonSemantics);

//compose the model and the property
const composedSemantics = new StepSynchronousProductSemantics(z2mcSemantics, z2mcDependentSemantics);

//convert to TR
const tr = new STR2TR(composedSemantics);

const start = performance.now();

//model check
const result = await ndfs_gs09_cdlp05(
    await tr.initial(), (c) => tr.next(c), (c) => c,
    (c) => tr.isAccepting(c),
    (c) => tr.configurationHashFn(c), (a, b) => tr.configurationEqFn(a, b));

const end = performance.now();

console.log(util.inspect(result, { depth: null, colors: true }));

console.log(`Execution time: ${end - start} ms`);

