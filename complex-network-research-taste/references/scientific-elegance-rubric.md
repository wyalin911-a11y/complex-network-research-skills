# Scientific Elegance and Naturalness Rubric

Use this reference when an idea is mathematically elaborate, built from several known
mechanisms, tailored for exact closure, or suspected of being reverse-engineered to produce
a desired phenomenon.

## 1. Four construction classes

### A. Micro-founded

The rule follows from a physical constraint, behavioral choice model, reliability mechanism,
or measurable microscopic process. Parameters have operational meaning and could in
principle be estimated independently of the headline result.

### B. Minimal phenomenological

The rule is not fully derived from data, but it is the simplest representation of a clear
scientific hypothesis. Removing a term removes a scientifically named process, not merely a
desired curve feature.

### C. Convenience-driven

The topology, independence assumption, response function, or normalization is selected
mainly because it closes the equations or simplifies simulation. This can be a useful
solvable benchmark, but it should not automatically be the main scientific model.

### D. Reverse-engineered

Components are chosen by their mathematical jobs: one creates a lower threshold, another
creates an upper threshold, and tuning creates the desired phase diagram. Ablations may
confirm those jobs while leaving the scientific motivation weak.

Classes C and D are not automatically invalid, but they sharply limit novelty, generality,
and claims of mechanism discovery.

## 2. Assumption-burden audit

Classify every important assumption as:

- `scientifically_required`: follows from the intended system or hypothesis;
- `standard_idealization`: common simplification with a known interpretation;
- `analytical_convenience`: primarily enables closure or proof;
- `phenomenon_enabling`: needed for the headline behavior to appear;
- `unjustified`: no clear scientific or mathematical necessity.

The number of assumptions matters less than their concentration. A central result that needs
several assumptions labeled `analytical_convenience` plus `phenomenon_enabling` has high
assumption debt.

## 3. Response-function provenance

For each custom function, ask:

1. Is its shape observed, derived, standard, or merely convenient?
2. Are its endpoints forced by normalization rather than mechanism?
3. Can every parameter be interpreted and varied independently?
4. Would a step function, integer rule, or one-parameter alternative preserve the claim?
5. Was the function chosen before or after the desired phenomenon was known?

Use these labels:

- `empirically_grounded`
- `microfounded`
- `standard_phenomenological`
- `minimal_custom`
- `tuned_custom`
- `reverse_engineered`

Custom functions deserve a penalty when several shape constraints jointly guarantee the
reported phenomenon.

## 4. Ensemble and scope audit

Random graphs, random hypergraphs, annealed ensembles, regular structures, and independence
closures are legitimate theoretical objects. Do not downgrade them merely because they make
analysis possible. Ask whether the ensemble matches the stated scientific question and
whether the conclusions are scoped to that ensemble.

Red flags include:

- using one ensemble while narrating a materially different system;
- hiding an assumption that directly predetermines the headline result;
- treating an ensemble-specific closure as a universal higher-order theorem;
- claiming robustness to structures that were not analyzed;
- criticizing a chosen theoretical ensemble merely for being idealized rather than showing
  a scientific mismatch.

A result can be strong while remaining specific to random hypergraphs. Additional ensembles
increase generality only when broader generality is part of the intended contribution; they
are not a compulsory admission ticket for a focused theoretical paper.

## 5. Parsimony test

Require a one-sentence causal explanation. Then try to remove, replace, or simplify each
component.

The idea is parsimonious when:

- every component has one scientifically named role;
- no simpler rule produces the same result with equal explanatory power;
- the phenomenon occupies a robust region rather than a tuned point;
- the mechanism remains recognizable outside the exact derivation.

The idea is overbuilt when the verbal explanation is substantially simpler than the model
because the extra machinery exists mainly to sculpt the mathematics.

## 6. Validation-versus-value distinction

Keep two ledgers.

### Technical evidence

- derivation correctness
- simulation agreement
- ablation results
- finite-size checks
- robustness scans
- reproducibility

### Scientific value

- natural question
- justified mechanism
- surprising consequence
- explanatory gain
- generality
- conceptual economy

Technical evidence raises confidence in what the model does. It does not automatically raise
the scientific value of why the model should exist. Never use a large technical ledger to
hide a weak scientific ledger.

## 7. Tractability classification

Classify the strongest available theory as:

1. `closed_form`: elementary or standard special-function expression for the target quantity;
2. `exact_implicit`: exact equation, but roots or boundaries require numerical solution;
3. `controlled_approximation`: stated approximation with an error regime;
4. `numerical_only`: no analytical reduction beyond direct computation.

Do not downgrade `exact_implicit` merely because radicals are unavailable. Instead ask whether
the theory explains the mechanism and whether it matches the project's stated goal. A project
promising explicit critical thresholds should be revised if its generic fixed-point equation
has high algebraic degree or high dimension.

For this user's default idea portfolio, apply a stricter gate to the central contribution:

- `closed_form`: passes;
- `explicit_asymptotic`: conditionally passes when the asymptotic regime is the intended
  scientific object;
- `exact_implicit`: does not pass by itself;
- `numerical_only`: does not pass.

An explicit result should isolate a scientifically central quantity such as a critical
threshold, transition boundary, stationary branch, stability condition, or scaling law. A
finite sum followed by numerical root-finding remains `exact_implicit`.

## 8. Simple-mechanism surprise test

Require all three statements to be true:

1. the new mechanism can be stated in two or three ordinary-language sentences;
2. the headline result is qualitative and not a direct restatement of the response rule;
3. the explicit theory explains why the unexpected result occurs and where it stops.

Examples of genuine surprise include a sign reversal, reentrance, discontinuous change of
transition type, counterproductive intervention, or a threshold law that contradicts a
natural monotonic expectation. A deliberately nonmonotonic input producing a nonmonotonic
output is not surprising without an additional derived consequence.

## 9. Simplicity Kill Test

Before recommending months of work, identify the cheapest simplification that could kill the
idea:

1. replace the custom response with the simplest independently motivated rule;
2. relax one nonessential assumption only when the central claim is intended to survive that
   relaxation;
3. remove endpoint forcing or one tuning parameter;
4. preserve the contact budget while changing grouping;
5. test whether the central phenomenon and its explanation survive.

Interpretation:

- survives with the same mechanism: naturalness and generality increase;
- survives but explanation changes: original mechanism claim is wrong or incomplete;
- disappears: classify the finding as construction-dependent;
- cannot be tested cheaply: raise scientific risk.

## 10. Verdict guardrails

- A technically complete Class D model should usually be `REVISE` or `PAUSE`, not promoted
  solely because substantial work has already been done.
- A Class C solvable model can be strong when its scope is explicit and its assumptions do not
  manufacture the claimed mechanism.
- L2 requires more than a designed nonmonotonic response producing nonmonotonic behavior.
- L3 requires evidence matching the breadth of the generality claim; it does not require every
  theoretical model to leave its intended random-network ensemble.
- If the simplest honest description is "we chose two functions to create two boundaries,"
  the project has not yet established mechanism-level novelty.
- An idea that lacks an identifiable explicit central result is `REVISE` under the user's
  default portfolio criteria, even when it remains publishable by ordinary field standards.
