# Idea Decision Report Template

Use this template only after all required upstream artifacts pass the input gate.

```yaml
decision: APPROVE | REVISE | REJECT | BLOCKED
decision_code: PASS | REVISION_REQUIRED | PRIOR_ART_COLLISION | KILL_TEST_FAILED | BLOCKED_MISSING_STAGE | BLOCKED_INCONSISTENT_INPUT | BLOCKED_UNTRACEABLE_EVIDENCE
idea_id: ""
current_state: IDEA_VALIDATED
next_state: IDEA_APPROVED | IDEA_SCREENED | IDEA_VALIDATED | IDEA_REJECTED | UNCHANGED
top_rank: null
scientific_maturity: L0 | L1 | L2 | L3 | L4 | null
kill_test_status: PASS | FAIL | REDESIGN_REQUIRED | NOT_RUN
prior_art_severity: LOW | MEDIUM | HIGH | UNKNOWN
novelty_gate: PASS | REVISE | UNKNOWN
simplicity_gate: PASS | REVISE | UNKNOWN
surprise_gate: PASS | REVISE | UNKNOWN
explicit_solution_gate: PASS | REVISE | UNKNOWN
explicit_solution_class: closed_form | explicit_asymptotic | exact_implicit | numerical_only | unknown
main_risk_level: LOW | MEDIUM | HIGH
missing_artifacts: []
input_artifacts:
  ideaspark: ""
  research_taste: ""
  aris_validation: ""
decided_at: YYYY-MM-DDTHH:MM:SSZ
```

# Complex Network Idea Decision Report

## Committee Decision

- **Decision:**
- **Decision code:**
- **Current state:**
- **Next state:**
- **Reason:**
- **Exact next action:**

## Input Gate

| Required artifact | Path or identifier | Candidate version | Status | Notes |
| --- | --- | --- | --- | --- |
| IdeaSpark candidates |  |  | PASS / FAIL |  |
| Research Taste screening |  |  | PASS / FAIL |  |
| ARIS novelty/reviewer validation |  |  | PASS / FAIL |  |

If any row fails, stop here and return `BLOCKED`.

## Comparative Decision Matrix

| Rank | Candidate ID | Mechanism | Four gates | Maturity | Prior-art risk | Kill Test | Feasibility | Main risk | Decision |
| ---: | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 1 |  |  |  |  |  |  |  |  |  |
| 2 |  |  |  |  |  |  |  |  |  |
| 3 |  |  |  |  |  |  |  |  |  |

## Finalists

### Candidate — `[candidate_id]`

#### Discovery hypothesis

Label the statement `HYPOTHESIZED` unless upstream evidence establishes it.

#### Evidence synthesis

- **KNOWN:**
- **INFERRED:**
- **HYPOTHESIZED:**
- **NEEDS_VERIFICATION:**

#### Why this is or is not A+B

Use the Research Taste artifact; do not recreate the screening.

#### Closest prior work and collision risk

Use the ARIS artifact and preserve its source identifiers.

#### Limiting dimension

State the single dimension that most constrains the candidate.

#### Four-gate audit

| Gate | Status | Evidence or reason |
| --- | --- | --- |
| Novelty | PASS / REVISE |  |
| Simplicity | PASS / REVISE |  |
| Surprise | PASS / REVISE |  |
| Explicit analytics | PASS / REVISE | Target quantity, solution class, and derivation route |

#### Kill Test

- Minimal setup:
- Observable:
- Success signal:
- Failure signal:
- Estimated effort:
- Stop rule:
- Status:

#### Theory and evidence obligations

| Evidence lane | Requirement | Current status | Approval implication |
| --- | --- | --- | --- |
| Theory | required / optional / not_applicable |  |  |
| Simulation | required / optional / not_applicable |  |  |
| Empirical | required / optional / not_applicable |  |  |

#### Scientific maturity and journal fit

Keep maturity and journal fit separate. State the strongest plausible current style and
the evidence gap to the next target.

#### Unresolved reviewer objection

State the strongest objection that remains after upstream validation.

#### Upgrade path

Specify the next falsifiable milestone, not a generic request for more work.

## Portfolio Labels

- **Best balance:**
- **Highest ceiling:**
- **Safest project:**
- **Most PRL-like:**
- **Most RESS-like:**
- **Most Nature-Communications-like:**

Omit a label when no candidate credibly fits it.

## Decision Audit

- [ ] All three required upstream artifacts are present.
- [ ] Candidate IDs and versions match.
- [ ] Every decision-relevant claim is traceable.
- [ ] Missing evidence was not silently reconstructed.
- [ ] Kill Tests include stop rules.
- [ ] Maturity and journal fit remain separate.
- [ ] Novelty, simplicity, surprise, and explicit analytics were each checked independently.
- [ ] The explicit result is not merely a finite sum followed by numerical root-finding.
- [ ] Approval does not authorize manuscript writing.
