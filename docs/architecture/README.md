# JARVIS architecture review 01

Date: 2026-09-07. Status: **Proposed for review; no implementation authorized.**

The repository initially contained only the original [product brief](../../JARVIS%20Architecture%20Brief%20for%20GPT-6%20Astra.md), with no AGENTS.md, source tree, or Git metadata. That brief was read in full. The user approved creating a concise root AGENTS.md; the original brief remains unchanged. No runtime, dependency, scaffolding, or application code has been added.

## Recommendation

Build a local-first personal control plane, not another agent harness. Keep JARVIS's identity, authority, task records, and memory in PostgreSQL; let Temporal own durable execution history and timers. Run existing agents through narrow adapters on execution nodes, using Podman for ordinary bounded compute and KVM/libvirt for isolated graphical and untrusted workloads. Make Omarchy the first desktop integration target, while keeping the core independent of a logged-in desktop and of Arch upgrades.

Start with one owner and one authoritative home node. Add execution nodes and clients without introducing competing copies of the core. Integrate Codex first, Claude Agent SDK second; retain OpenCode as the first alternative for provider flexibility. Use existing browser and computer-use tools within those harnesses before adding another dedicated autonomous browser agent.

## Read in this order

1. [System architecture](system-design.md): requirements, boundaries, responsibilities, routing, surfaces, deployment, scaling.
2. [Contracts and lifecycles](contracts-and-lifecycles.md): proposed interface semantics, sequences, state machines, workflow recovery.
3. [Data and memory](data-and-memory.md): ownership, logical schema, ER diagram, retrieval, curation, retention.
4. [Security and operations](security-and-operations.md): authority enforcement, threat model, failure matrix, observability, recovery targets.
5. [Decision records](decisions.md): ten consequential proposals with alternatives and revisit criteria.
6. [Research register](research.md): primary sources, observed capabilities, limits, and build-versus-integrate evidence.
7. [Review gates and roadmap](review-and-roadmap.md): assumptions, acceptance scenarios, staged future work, coverage of the brief.

Diagrams are Mermaid source embedded in Markdown. The documents define contracts conceptually; they are not generated schemas, migrations, or implementation files.

## Decisions that most need review

| Choice | Why it matters |
| --- | --- |
| Temporal rather than embedded DBOS | Better separation of durable orchestration from workers; higher operational cost. |
| Single authoritative local home node | Clear consistency and privacy; continuity pauses if that machine sleeps or fails. |
| VM for authenticated delegated desktop work | Stronger isolation at a material RAM/storage cost. |
| No unattended high-impact GUI transactions without enforceable mediation | A browser cookie commonly carries more authority than a task should receive. |
| Canonical relational memory with optional Graphiti projection | Preserves JARVIS ownership and deletion semantics; custom curation policy remains necessary. |

All numerical targets are proposed acceptance budgets, not measured performance. Integration feasibility, hardware capacity, model quality, and account entitlements remain validation gates. Approval of this design should precede any implementation work.
