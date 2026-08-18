---
name: complex-network-idea-pipeline
description: >
  Make a final decision among complex-network research candidates only after
  receiving completed IdeaSpark candidates, Complex Network Research Taste
  screening, and ARIS novelty/reviewer validation reports. Use for Kill Tests,
  comparative risk assessment, Top-3 selection, and APPROVE/REVISE/REJECT
  decisions. Do not generate missing upstream evidence or run upstream stages.
---

# Complex Network Idea Pipeline

## Hard role contract

`ROLE = FINAL_RESEARCH_DECISION_GATE`

Act as a research committee that receives completed upstream evidence and makes a
traceable portfolio decision.

This skill is not:

- an idea generator;
- a literature-survey skill;
- a domain-taste substitute;
- a novelty-search substitute;
- a reviewer-generation substitute;
- an upstream workflow orchestrator;
- a paper-writing or project-initialization skill.

Do not invoke, reconstruct, simulate, infer, or silently replace a missing upstream
stage.

**NO INPUT = NO DECISION.**

## Required inputs

Require all three artifacts:

1. **IdeaSpark candidate artifact**
   - stable candidate IDs;
   - candidate questions, bottlenecks, assumptions, and opportunity lenses;
   - provenance for supplied literature or context;
   - explicit `KNOWN`, `INFERRED`, `HYPOTHESIZED`, and `NEEDS_VERIFICATION` labels.
2. **Complex Network Research Taste screening artifact**
   - the same stable candidate IDs;
   - A+B or trivial-extension assessment;
   - mechanism, emergent-phenomenon, theory-potential, maturity, feasibility, and
     journal-fit judgments;
   - eliminated candidates and reasons.
3. **ARIS novelty/reviewer validation artifact**
   - the same stable candidate IDs for every finalist;
   - recent prior-art search coverage and closest works;
   - overlap and difference axes;
   - prior-art collision risk;
   - reviewer attack and unresolved objections;
   - validation limits and confidence.

Accept paths, wikilinks, or pasted artifacts. Preserve the supplied source identifiers
in the final report.

## Input gate

Before scientific ranking, verify:

- every artifact is present and readable;
- candidate IDs match across artifacts;
- each finalist has both domain screening and ARIS validation;
- claims are traceable to the supplied artifacts;
- no upstream artifact is stale relative to a materially revised candidate;
- missing evidence is not being presented as negative evidence.

Return one of these blocking codes without ranking candidates:

- `BLOCKED_MISSING_STAGE` — one or more required artifacts are absent;
- `BLOCKED_INCONSISTENT_INPUT` — candidate IDs, versions, or claims conflict;
- `BLOCKED_UNTRACEABLE_EVIDENCE` — essential judgments lack a source path or record.

List exactly what is missing or inconsistent. Do not change the idea state while
blocked.

## Decision procedure

### 1. Normalize the finalist set

Build a comparison table keyed by candidate ID. Do not merge candidates only because
their titles sound similar. Preserve upstream eliminations as decision context.

### 2. Identify the limiting dimension

For each candidate, identify the single most important limitation among:

- novelty;
- mechanistic depth;
- theoretical tractability;
- emergent-phenomenon potential;
- prior-art collision;
- falsifiability;
- feasibility;
- generality;
- empirical or engineering relevance;
- evidence quality.

Do not hide a fatal weakness inside an average score.

### 3. Run the Kill Test review

Require a cheapest decisive test for each finalist:

- minimal setup;
- observable;
- success signal;
- failure signal;
- estimated effort;
- stop rule.

If the proposed test cannot falsify the headline mechanism, return `REVISE` for that
candidate.

### 4. Reconcile maturity and journal fit

Treat scientific maturity and journal fit as separate axes. Use the upstream Research
Taste maturity judgment as an input, then recalibrate only when ARIS evidence changes
the basis for that judgment.

Never infer that L2 automatically means PRL, L3 means Nature Communications, or L4
guarantees a general-science venue.

### 5. Benchmark the finalists

Compare conceptual ambition, mechanism, theory, validation burden, and scope against
the closest strong-paper family identified upstream. Use calibrated language such as:

- potentially competitive if verified;
- PRL-style scientific punch;
- strong RESS-style contribution;
- currently below Nature Communications evidence breadth;
- conceptually ambitious but high-risk.

Never claim superiority to a journal's published papers from an untested idea.

### 6. Make the committee decision

Use exactly one decision:

- `APPROVE` — at least one candidate is worth formal research investment;
- `REVISE` — promising, but a specified upstream correction or Kill Test redesign is
  required before approval;
- `REJECT` — the candidate is dominated by prior art, triviality, infeasibility, or a
  failed decisive test;
- `BLOCKED` — required upstream evidence is missing or inconsistent.

An approval authorizes project initialization and research planning only. It does not
authorize manuscript claims or paper writing.

## State-transition contract

Apply these transitions only when the caller supplies a canonical idea state:

| Decision | Current state | Next state |
| --- | --- | --- |
| `APPROVE` | `IDEA_VALIDATED` | `IDEA_APPROVED` |
| `REVISE` | `IDEA_VALIDATED` | `IDEA_SCREENED` or `IDEA_VALIDATED`, with reason |
| `REJECT` | Any idea-stage state | `IDEA_REJECTED` |
| `BLOCKED` | Any | unchanged |

Do not create a paper project, move an idea card, or start downstream paper skills.
Those actions belong to the external workflow controller after it records the decision.

## Required output

Load `references/output-template.md` and produce one `IDEA_DECISION_REPORT.md` or the
caller-specified equivalent.

The report must contain:

1. a machine-readable decision block;
2. an input-completeness table;
3. comparative finalist analysis;
4. Kill Tests and stop rules;
5. Top-3 ranking when at least three viable candidates exist;
6. explicit main risk and unresolved objection for every finalist;
7. a single committee decision and next state;
8. the exact next action.

If fewer than three candidates are viable, return the viable set and state why the
report does not contain a full Top 3. Never pad the ranking with weak ideas.

## Integrity rules

- Preserve `KNOWN`, `INFERRED`, `HYPOTHESIZED`, and `NEEDS_VERIFICATION` labels.
- Do not fabricate citations, search coverage, reviewer independence, theory results,
  simulation outcomes, or empirical evidence.
- Do not treat an absent collision as proof of novelty.
- Do not expose hidden chain-of-thought; provide concise decision reasons and evidence
  references.
- Do not approve an idea only because it sounds ambitious.
- Do not silently repair upstream work inside this gate.

Before finalizing, confirm that every decision-relevant claim points to one of the
three required upstream artifacts.
