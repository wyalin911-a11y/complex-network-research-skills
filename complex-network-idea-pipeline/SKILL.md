---
name: complex-network-idea-pipeline
description: >
  Run an end-to-end research idea discovery and evolution workflow for complex networks,
  network science, management science & engineering, reliability/resilience, cascading
  failures, percolation, hypergraphs, multilayer/interdependent networks, and related
  complex systems. Use when the user asks to find strong research ideas, find a thesis
  direction, run deep/top-journal ideation, compare candidate ideas, or produce a
  literature-grounded Top-3 research blueprint with novelty checks, reviewer attacks,
  Kill Tests, maturity levels, journal fit, and upgrade paths.
---

# Complex Network Idea Pipeline

## Mission

Act as the research director.

Coordinate creative ideation, domain-specific scientific taste, prior-art checking,
reviewer attack, and refinement.

The goal is not to output many clever-sounding topics. The goal is to identify the
small number of research directions with the highest expected scientific value.

## Preferred skill team

When installed and available, use the following division of labor:

1. `idea-spark` — literature-grounded creative ideation and bottleneck diagnosis.
2. `paper-search` / `scoop-check` — ResearchStudio literature and prior-art support.
3. `complex-network-research-taste` — domain-specific scientific judgment.
4. ARIS idea-discovery family — deep novelty verification, reviewer attack, refinement.
5. this skill — orchestration, Kill Tests, final ranking, and idea evolution.

ARIS skills of particular interest:
- `idea-discovery`
- `idea-creator`
- `novelty-check`
- `research-review`
- `research-refine-pipeline`

Do not duplicate an upstream workflow when it is already available and appropriate.

If an upstream skill is unavailable, continue with an internal equivalent workflow and
clearly mark which validation stage was not independently delegated.

## Context discipline

If the user provides local papers, a literature folder, a reference paper, an existing
model, code, or preliminary results, inspect those first and treat them as primary
research context.

Do not ignore existing work and rediscover it from scratch.

## Default mode

Unless otherwise requested:

- literature horizon: recent 3–5 years + foundational papers
- internal idea seeds: at least 20
- finalists returned: 3
- minimum maturity target: L1
- preference: ideas with credible L2 upgrade path
- research risk: balanced
- output language: Chinese, with technical English where clearer

## Deep Mode

Activate when the user says:
- deep mode
- 顶刊模式
- PRL-level
- Nature-level
- 最强 idea
- 认真找一个 idea

Deep Mode requires:
- broader literature search
- multiple ideation lenses
- aggressive prior-art search
- domain taste filtering
- independent reviewer attack when possible
- explicit top-journal benchmarking
- Kill Test for each finalist
- no 9+/10 novelty score without evidence

Prefer 3 excellent ideas over 20 mediocre ones.

## Stage 0 — Research brief

Extract:

- exact scientific area
- user's existing models/papers/results
- preferred theory vs simulation vs empirical balance
- available compute/data
- time horizon
- target scientific style
- non-goals

If noncritical constraints are absent, proceed with explicit reasonable defaults.

## Stage 1 — Literature landscape

Build:

**Problem → Existing models → Mechanisms → Phenomena → Theory → Limitations → Open tensions**

Search recent literature with multiple query formulations.

Identify:
- recurring assumptions
- unresolved contradictions
- limitations repeated across papers
- common approximations
- mechanisms studied independently but not jointly
- claims that may fail under higher-order/correlated/temporal structure

Do not infer novelty from keyword absence alone.

## Stage 2 — Candidate generation

Generate at least 20 internal seeds using multiple lenses:

- assumption breaking
- competing mechanisms
- correlated heterogeneity
- local–global mismatch
- approximation failure
- control paradox
- higher-order interactions
- time-scale competition
- endogenous adaptation
- theory–decision bridge

When `idea-spark` is available, use it as a high-quality creative generator rather than
replacing it with generic brainstorming.

Do not show all seeds unless requested.

## Stage 3 — Domain taste filter

Use `complex-network-research-taste`.

Remove ideas dominated by:
- A+B novelty
- topology substitution
- parameter addition
- curve-shift results
- unmotivated hypergraphs
- decorative optimization
- low theoretical or mechanistic content

Keep ideas whose new mechanism plausibly causes qualitatively new behavior.

## Stage 4 — First literature collision check

For the surviving pool, identify:
- closest prior paper
- overlap axis
- difference axis
- collision risk

If `scoop-check` or ARIS `novelty-check` is available, use it.

Do not kill a candidate merely because related work exists. Kill it when the core novelty
claim is already covered.

## Stage 5 — Reviewer attack

For the strongest 5–8 candidates, attack:

- Why is this not trivial?
- Is the effect obvious?
- Does the new mechanism matter?
- Could existing theory already predict it?
- Is it one tuned parameter point?
- Is the engineering meaning real?
- Is the model unnecessarily complex?

Use ARIS `research-review` when available.

## Stage 6 — Theory-potential check

For each remaining candidate, ask what can be derived:

- cavity/message-passing equations
- generating functions
- self-consistency equations
- stability conditions
- bifurcation boundaries
- critical/tricritical conditions
- scaling
- exact limiting cases

Prefer candidates where a new phenomenon has a plausible explanation, not only a plot.

## Stage 7 — Kill Test

Design the cheapest falsification test.

Examples:
- solve a one-dimensional fixed-point equation
- continuation of a control-parameter branch
- small simulation at N≈10^4
- remove the proposed mechanism
- compare two network ensembles
- inspect finite-size behavior near the predicted transition

A Kill Test must specify:
- minimal setup
- observable
- success signal
- failure signal
- estimated effort

If the idea fails cheaply, recommend stopping early.

## Stage 8 — Scientific maturity + journal fit

Use `complex-network-research-taste`.

Assign:

- L0 — Below strong-paper threshold
- L1 — Strong Publishable Research
- L2 — New Discovery
- L3 — General Mechanism
- L4 — Broad Scientific Significance

Then separately score journal fit.

Never convert maturity directly into a journal recommendation.

## Stage 9 — Top-journal benchmark

For the Top 3, compare conceptual ambition with recent strong papers in the closest area.

Ask:
- Is the mechanism equally deep?
- Is the discovery equally surprising?
- Is the theory equally convincing?
- Is the evidence equally broad?
- What is the biggest gap?

Use calibrated language:
- potentially competitive if verified
- PRL-style scientific punch
- strong RESS-style contribution
- currently below Nature Communications evidence breadth
- conceptually ambitious but high-risk

Never say "better than Nature papers" based only on an idea.

## Stage 10 — Idea Evolution

For each finalist, provide the next maturity upgrade.

Examples:
- L1 → L2: discover and explain a new phase/critical phenomenon
- L2 → L3: prove generality across ensembles and finite size
- L3 → L4: establish a cross-domain general principle with strong evidence

## Stage 11 — Final ranking

Return Top 3.

Also identify:
- Best balance
- Highest ceiling
- Safest project
- Most PRL-like
- Most RESS-like
- Most Nature-Communications-like

These may be different ideas.

## Expected-value rule

Prefer:

Novelty 8.5 / Feasibility 8.5 / Generality 8

over:

Novelty 9.8 / Feasibility 2 / Generality unknown

unless the user explicitly wants high-risk/high-reward research.

## Required final format

Load `references/output-template.md`.

Each idea must clearly distinguish:

- KNOWN
- INFERRED
- HYPOTHESIZED
- NEEDS VERIFICATION

Do not expose hidden chain-of-thought.

## Final integrity gate

Before recommending an idea, verify:

- literature checked?
- nearest prior work identified?
- mechanism not decorative?
- predicted phenomenon falsifiable?
- theory route plausible?
- Kill Test defined?
- generality considered?
- maturity separate from journal fit?
- scientific risk stated?
- worth months of research effort?

If several answers are no, do not recommend the idea.
