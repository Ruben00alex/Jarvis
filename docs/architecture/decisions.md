# Architectural decision records

All records dated 2026-09-07. **Status for every record: Proposed.** User review has not accepted these choices. Sources and capability limits are in [research](research.md); the rationale below is architectural judgment rather than vendor claims.

## ADR-001 — Small persistent control plane; existing agents execute

**Context:** The product needs continuity beyond any agent session without rebuilding coding/computer-use infrastructure.

**Decision:** One modular core and worker codebase, a thin execution supervisor and a separate action/resource broker. Delegate iterative tool execution to existing harnesses. Domain policies are custom; infrastructure engines are integrated.

**Alternatives:** A new universal agent loop would duplicate mature software. Making a single vendor session canonical would couple identity and recovery to that vendor. A microservice per logical module increases failure and deployment surfaces too early.

**Consequences:** Modules need disciplined ownership and contracts. Native capabilities may differ across adapters. Infrastructure integration and policy remain significant engineering work.

**Revisit when:** A module needs independent security isolation, materially different scaling, or independently managed availability—not merely because it has a name.

## ADR-002 — Temporal for durable work

**Context:** Months-long waits, approvals, node failures and changing workflow definitions need reliable execution beyond process lifetimes.

**Decision:** Integrate Temporal and use a small set of reviewed workflow definitions. Keep domain state in PostgreSQL and engine history in separate persistence. External side effects use receipts and reconciliation.

**Alternatives:** DBOS is the strongest smaller-footprint option: Postgres-backed durable execution would simplify initial operations. Restate offers a compact durable service runtime. Neither is rejected as incapable; Temporal is preferred for explicit workflow/worker separation and operational lifecycle fit. A custom timer/retry service is rejected.

**Consequences:** Adds real operational cost and two-store coordination. Determinism/versioning impose discipline. No exactly-once external-action guarantee follows from engine durability.

**Revisit when:** A measured single-node deployment exceeds the agreed footprint, or operational expertise is insufficient. Run the same approval/restart/upgrade/ambiguous-action scenarios against DBOS before switching. Do not hide the engine behind a giant portability framework; accept migration work if changed.

## ADR-003 — PostgreSQL canonical memory, optional graph projection

**Context:** Tasks, permissions, source archives and time-dependent claims need joined access control and provenance, not just similarity search.

**Decision:** PostgreSQL with relational and full-text queries plus pgvector; encrypted blob storage for large payloads. Keep graph extraction/search optional and rebuildable, evaluating Graphiti first.

**Alternatives:** Mem0 supplies reusable memory extraction/retrieval; Letta supplies stateful agents; Graphiti aligns with temporal graph recall. None eliminates the need for JARVIS-specific authority and operational-memory linkage. A dedicated graph/vector service is premature absent measured need.

**Consequences:** JARVIS must implement domain curation and recall policies. Avoid expanding those into a generic memory platform. Search quality needs evaluation, not assumed gains from embeddings.

**Revisit when:** Complex relationship retrieval fails measured relevance/latency targets and a graph projection demonstrably improves them while preserving deletion and compartment behavior.

## ADR-004 — Omarchy first desktop, portable Linux core

**Context:** Omarchy already integrates agent launchers, skills and a plugin-based desktop; persistence must survive shell logout or replacement.

**Decision:** Integrate installation and UI conventions, keep core services outside the user session, and use explicit pinned harness interfaces for managed jobs. Do not inherit unattended launcher authority.

**Alternatives:** Forking Omarchy creates needless maintenance. Treating it as generic Arch misses useful facilities. Requiring it on the always-on core couples durability to a rolling desktop environment.

**Consequences:** Must test actual release capabilities and retain an OS integration module. Native desktop shortcuts remain user-owned workflows unless explicitly adopted into JARVIS management.

**Revisit when:** Omarchy provides a supported secure job interface that meets lifecycle/authority requirements, or another desktop becomes a required target.

## ADR-005 — Separate execution substrate from trust and persistence

**Context:** Ordinary builds, authenticated desktops and hostile files have different resource and isolation needs.

**Decision:** Rootless Podman for bounded compute; KVM/libvirt VMs for delegated GUI and stronger isolation. Workspace manifests represent desired state, trust, resources and restore level independently of substrate.

**Alternatives:** Containers for everything are not a strong hostile-code boundary. VMs for every small task waste resources. A headless browser profile is useful but not universal application state. Cua's runtime ownership is optional; do not let both it and libvirt independently control the same VM.

**Consequences:** VM resource cost and guest maintenance. A snapshot cannot roll back outside systems. No guaranteed portable RAM restore.

**Revisit when:** An integrated workspace product proves the same isolation, recovery, inspectability and local residency with lower maintenance. Adopt its lifecycle as the sole backend for those workspaces.

## ADR-006 — Thin native harness adapters with capability negotiation

**Context:** Harnesses overlap but do not share every approval, steering or resume feature.

**Decision:** Codex first, Claude Agent SDK second, OpenCode next when needed. Normalize start/observe/cancel/outcome and advertise optional features; preserve native extensions. Use ACP where sufficient, MCP for tools rather than universal task execution.

**Alternatives:** A giant normalized tool interface erases capabilities. CLI stdout scraping is brittle when structured protocols exist. Integrating every harness immediately multiplies the compatibility matrix without evidence of benefit.

**Consequences:** Adapter-specific conformance tests and pinned versions are necessary. Provider switch may require a new execution with exported context rather than native session migration.

**Revisit when:** Benchmarks demonstrate a task-class advantage, account access changes, or a common protocol genuinely covers required semantics.

## ADR-007 — Enforce permissions outside cognition

**Context:** Shell, browser cookies, MCP tools and auto-approval can bypass prompt-level intent restrictions.

**Decision:** Brokered grants and mediated external actions, OS/network isolation, intent-bound approvals and explicit authenticated-GUI limits. Keep high-impact approvals outside an agent-controlled surface when needed.

**Alternatives:** Tool prompts or semantic classifiers alone cannot enforce reach. Unlimited personal browser access is not task-scoped. A credential vault alone does not authorize individual actions.

**Consequences:** Some desirable GUI autonomy is unavailable without limited accounts or reliable mediation. The trusted computing base includes the broker and OS. A fully compromised trusted desktop remains a serious threat.

**Revisit when:** A provider supplies verifiable action-scoped credentials/transactions or a GUI execution boundary with testable enforcement. Convenience is not evidence of safety.

## ADR-008 — Transactional outbox, no independent event bus initially

**Context:** Event-triggered work must survive failures without duplicating mutations or requiring excessive infrastructure.

**Decision:** Durable ingress/outbox/inbox in PostgreSQL, delivery into Temporal; CloudEvents-compatible metadata. Use source cursors and reconciliation for gaps.

**Alternatives:** In-memory pub/sub loses work. Database notifications alone are not durable delivery. A separate streaming platform adds another operational system before throughput warrants it.

**Consequences:** JARVIS needs a bounded dispatcher and idempotent consumers. No global ordering or universal source replay. Outbox backlog must be monitored.

**Revisit when:** Measured event volume/fanout isolates this bottleneck after coalescing; integrate a mature bus then, preserving event IDs and semantics.

## ADR-009 — One authoritative home node, many clients and executors

**Context:** A personal agent must coordinate authority across devices under network partitions.

**Decision:** Single writable core authority; paired clients, fenced node leases, durable backend conversation IDs. Optional always-on server placement; no active-active device cores initially.

**Alternatives:** Synchronizing agent session folders does not resolve task/permission conflicts. Multi-master memory and action execution require a larger distributed consistency design.

**Consequences:** Home-node outage pauses new work and approvals. Offline clients queue drafts, not authoritative actions. Availability upgrades use supported storage/workflow replication plus fencing.

**Revisit when:** Agreed availability requirements cannot tolerate this dependency and an operating plan funds tested failover.

## ADR-010 — Evidence-based completion and bounded retention

**Context:** Agent reports, UI success messages and remembered summaries can be wrong; archives contain sensitive data.

**Decision:** Separate task status from evidence strength; verify important effects using observable state. Preserve raw committed conversations subject to user exclusion/deletion; derived memory remains traceable and erasable. Store structured decisions and receipts, not hidden reasoning.

**Alternatives:** Treating exit status as success loses correctness. Retaining all raw media indefinitely creates unnecessary exposure. Deleting only vectors leaves source and derived content behind.

**Consequences:** Some tasks end with an honest unknown outcome and human reconciliation. Deletion must propagate through projections, snapshots and restore procedures. Verifier design becomes part of each capability.

**Revisit when:** A capability offers stronger transactional evidence or a changed retention policy is explicitly chosen by the owner.
