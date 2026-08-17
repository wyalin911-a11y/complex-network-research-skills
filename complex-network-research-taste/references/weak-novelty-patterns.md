# Weak-Novelty Patterns

These patterns are not automatically bad, but are weak by themselves.

## Usually weak without a new mechanism
- ER → scale-free
- graph → hypergraph
- static → temporal
- homogeneous → heterogeneous
- random attack → targeted attack
- add one recovery/dependency parameter
- change one degree distribution
- add another network layer
- compare additional attack strategies
- apply known centrality to new data
- run an existing method on another empirical network
- couple two known models without emergent consequences
- use ML only to predict an existing network metric
- produce more phase diagrams without new phase structure

## A+B diagnostic
Ask:
1. Was A already studied?
2. Was B already studied?
3. Is A+B scientifically motivated?
4. What causal mechanism exists only when both coexist?
5. What qualitative behavior appears that neither A nor B has alone?
6. Can it be derived or mechanistically explained?

Weak answers to 4–6 imply combination novelty.

## Curve-shift diagnostic
If the headline result is "x increases/decreases robustness", ask whether there is:
sign reversal, non-monotonicity, phase change, threshold law, structural explanation,
or policy reversal. If not, likely incremental.

## Hypergraph diagnostic
Do not reward hypergraphs because they are fashionable. Require group-level interaction
whose pairwise projection loses essential information.

## Heterogeneity diagnostic
Do not reward heterogeneity if it only broadens curves. Prefer branch splitting,
double transitions, averaging failure, correlation effects, or new criticality.

## Management-science diagnostic
Do not append optimization after the physics is finished. A decision problem should
be changed by the newly discovered mechanism.
