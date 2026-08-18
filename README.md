# Complex Network Research Skill Suite v3

A modular Codex research-idea system for complex networks, Management Science & Engineering,
reliability/resilience, cascading failures, percolation, hypergraphs, multilayer/interdependent
networks, threshold dynamics, infrastructure systems, supply chains, and systemic risk.

## What changed in v3

v3 turns `complex-network-idea-pipeline` into a **final research decision gate**.
It no longer generates ideas, runs literature search, substitutes for domain screening,
or silently reconstructs ARIS validation. It requires three completed upstream artifacts:

1. IdeaSpark candidates;
2. Complex Network Research Taste screening;
3. ARIS novelty/reviewer validation.

Missing input now produces `BLOCKED_MISSING_STAGE`: **NO INPUT = NO DECISION**.
The output includes a machine-readable decision, Kill Tests, comparative risk, Top-3
ranking when justified, and an `APPROVE` / `REVISE` / `REJECT` / `BLOCKED` verdict.

v2 replaced copied custom-skill installation with **symlink installation** and added a
single-command updater. v3 keeps that model.

The intended update model is now:

```text
Git repository / stable source directory
        ↓
      symlink
        ↓
Codex skill directory
```

Therefore an existing skill does not need to be manually copied after every content update.

Important: a symlink does not download updates by itself. `git pull` updates the source
repository; the symlink makes Codex immediately point to the updated files.

## Research team architecture

```text
Microsoft ResearchStudio / idea-spark
        ↓
creative generation + bottleneck-driven ideation

complex-network-research-taste
        ↓
domain scientific taste + L1–L4 maturity + journal fit

ARIS validation components
        ↓
novelty verification + reviewer attack + refinement

complex-network-idea-pipeline
        ↓
final decision gate + Kill Test + Top-3 + state decision
```

The two custom skills in this package do **not** duplicate IdeaSpark or ARIS.
`complex-network-research-taste` screens candidates; `complex-network-idea-pipeline`
consumes completed upstream artifacts and makes the final decision. An external workflow
controller, such as a project's `AGENTS.md`, owns stage routing and state transitions.

## Files

```text
complex-network-research-skill-suite-v3/
├── README.md
├── UPGRADE_NOTES.md
├── bootstrap.sh
├── install_custom_symlinks.sh
├── register_aris_project.sh
├── update_all.sh
├── doctor.sh
├── manifest.json
├── config/
│   └── aris_projects.txt.example
├── complex-network-research-taste/
│   ├── SKILL.md
│   └── references/
│       ├── journals.md
│       ├── novelty-rubric.md
│       ├── research-patterns.md
│       └── weak-novelty-patterns.md
└── complex-network-idea-pipeline/
    ├── SKILL.md
    └── references/
        └── output-template.md
```

# Recommended macOS setup

## Option A: quickest first installation

Keep this folder in a stable location, for example:

```bash
mkdir -p ~/.local/share/research-tools
mv ~/Downloads/complex-network-research-skill-suite-v3 \
  ~/.local/share/research-tools/complex-network-research-skills
```

Then:

```bash
cd ~/.local/share/research-tools/complex-network-research-skills
bash bootstrap.sh
```

This will:

1. symlink the two custom complex-network skills into Codex;
2. clone Microsoft ResearchStudio if missing;
3. install ResearchStudio-Idea (`idea-spark`, `paper-search`, `scoop-check`) for Codex;
4. clone ARIS if missing.

Restart Codex afterward.

## Add ARIS to a research project

For a project such as:

```text
~/Research/hypergraph-resilience
```

run:

```bash
cd ~/.local/share/research-tools/complex-network-research-skills

bash bootstrap.sh \
  --project "$HOME/Research/hypergraph-resilience"
```

The initial ARIS selection remains controlled by ARIS's own installer.
If installation succeeds, the project is registered in:

```text
config/aris_projects.txt
```

for future reconciliation.

You can also register an already configured ARIS project:

```bash
bash register_aris_project.sh \
  "$HOME/Research/hypergraph-resilience"
```

# Updating everything later

Run:

```bash
cd ~/.local/share/research-tools/complex-network-research-skills
bash update_all.sh
```

This attempts to:

1. `git pull --ff-only` the custom suite if it is a Git clone;
2. refresh the custom skill symlinks;
3. `git pull --ff-only` Microsoft ResearchStudio;
4. re-run its idempotent Idea installer so new/renamed Idea skills can be linked;
5. `git pull --ff-only` ARIS;
6. reconcile ARIS for every registered project.

By default ARIS reconciliation uses a conservative new-skill policy.

To allow newly added upstream ARIS skills during reconciliation:

```bash
bash update_all.sh --aris-add-new
```

To reconcile an additional project once:

```bash
bash update_all.sh \
  --project "$HOME/Research/another-project"
```

# Health check

Run:

```bash
bash doctor.sh
```

It reports:

- whether custom skills are symlinks;
- whether `idea-spark`, `paper-search`, and `scoop-check` are visible;
- the Git branch/commit for ResearchStudio, ARIS, and the custom suite;
- whether a source directory is a Git worktree.

# Make the custom skills Git-updatable too

If this folder is only an extracted ZIP, the custom skills are still symlinked, but there
is no upstream Git repository to pull from.

To get the full "one command updates everything" experience, put this entire folder into
your own Git repository and clone it to a stable local path.

Conceptually:

```text
your GitHub repository
        ↓ git pull
~/.local/share/research-tools/complex-network-research-skills
        ↓ symlink
~/.agents/skills/complex-network-research-taste
~/.agents/skills/complex-network-idea-pipeline
```

After that, edits committed to your GitHub repository can be obtained with `git pull`;
no manual copying to `$HOME/.agents/skills` is necessary.

# Scientific maturity model

Scientific maturity and journal fit remain separate axes.

## Scientific maturity

- L0 — below strong-paper threshold
- L1 — Strong Publishable Research
- L2 — New Discovery
- L3 — General Mechanism
- L4 — Broad Scientific Significance

## Journal fit

Scored separately for:

- Physical Review E
- Chaos
- Chaos, Solitons & Fractals
- Reliability Engineering & System Safety
- Communications Physics
- Physical Review Letters
- PNAS
- Science Advances
- Nature Communications
- Nature
- Science

A high-quality PRL-style theoretical idea can have modest RESS fit.
A strong engineering reliability contribution can have high RESS fit and lower PRL fit.

# Suggested prompts

```text
Use complex-network-idea-pipeline as the final decision gate.
Inputs:
- IdeaSpark candidates: /path/to/IDEASPARK_CANDIDATES.md
- Research Taste screening: /path/to/TASTE_SCREENING.md
- ARIS validation: /path/to/ARIS_VALIDATION.md
Return an input-gate verdict, Kill Tests, comparative risk, Top 3 if justified,
and one APPROVE/REVISE/REJECT/BLOCKED decision.
```

```text
Use complex-network-research-taste to evaluate this idea.
Do not generate alternatives yet.
Check whether it is A+B novelty, identify the mechanism and plausible new phenomenon,
assign maturity, and score journal fit.
```

```text
Use complex-network-idea-pipeline to compare these completed upstream artifacts.
Apply a PRL-style benchmark, but do not change IDEA_VALIDATED to IDEA_APPROVED unless
all required inputs are traceable and the Kill Test is decisive.
```

# Update semantics in one sentence

**Git is responsible for fetching the new source; symlinks are responsible for making
Codex use that source without recopying it.**
