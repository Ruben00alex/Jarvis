# Decisions and deliberate deferrals

Updated 2026-09-07 after the user endorsed the four modules and requested concrete subdivisions and stack choices. The first iteration's ten proposed ADRs are preserved in Git commit `300b7c3`; they were never accepted implementation requirements. Their stack/topology choices are superseded by this record. The research evidence remains available separately.

## ADR-011 — Independent modules before a shared platform

**Status:** governing design direction requested by the user; the particular module boundaries remain proposed.

**Problem:** iteration 1 required shared tasks, permissions, workflows, storage and orchestration before a useful part could be evaluated. It selected an eventual system too early.

**Decision:** every module must accept supplied input, produce observable output and have a standalone evaluation that requires no other unfinished JARVIS module. Build only the connection needed by a real use case. Manual callers and prepared resources are valid starting points.

**Alternatives:** building the shared core first retains the original dependency problem. Turning every module into a service merely distributes it. Treating integration tests as substitutes for module evaluation prevents understanding which boundary failed.

**Consequences:** some setup is initially manual. A standalone exercise proves limited behavior; real integration still needs evaluation. Module internals and small contracts may change as evidence arrives.

**Revisit:** adjust module boundaries when an actual consumer exposes friction; preserve independent evaluability as the criterion.

## ADR-012 — Execution as the first exercise

**Status:** recommendation, not an implementation authorization or mandatory project order.

**Decision:** first evaluate a bounded repository-analysis request through one existing harness against a prepared isolated location. Provisionally use Codex because prior research found a suitable structured integration surface. Do not build memory, environment provisioning or automated planning for this exercise.

**Alternatives:** Recall is also an independently valid starting point if memory is the user's immediate priority. A full voice-to-code flow obscures which integration works and introduces several unfinished dependencies.

**Consequences:** this proves the execution seam, not the whole JARVIS product. Credentials and actual isolation remain required. A second provider is useful only when testing replaceability or meeting a concrete capability need.

**Revisit:** change the first exercise or provider if the available host/account or user priority makes another path more informative.

## Decision ledger

| Item | Current status | Evidence that would justify deciding more |
| --- | --- | --- |
| Persistent state outside provider sessions | Product invariant retained | Storage implementation still open |
| Reuse existing agent loops | Product invariant retained | A demonstrated integration gap before custom replacement |
| Execution, Environments, Recall, Conversation boundaries | User endorsed; subdivisions proposed | Standalone exercise and first real caller |
| Codex App Server as first harness interface | Proposed default | Supported account/host, lifecycle exercise |
| Database engine | SQLite per module proposed; no shared schema | Actual concurrency and backup evaluation |
| Temporal / DBOS / Restate | Deferred | A concrete durable wait/restart scenario |
| Workspace backend | Rootless Podman first; libvirt/KVM for GUI/stronger isolation | Available Linux host and isolation exercise |
| Graphiti / Mem0 / other memory implementation | Candidate evidence only | Retrieval, provenance, deletion evaluation |
| Central broker, event bus, lease protocol | Deferred | Shared/remote authority or concurrent execution need |
| Omarchy as primary desktop | Candidate aligned with brief | Target machine and a useful module to expose |
| Language and local deployment | TypeScript/Node 24; trusted host plus environment account proposed | Module/runtime tests; remote topology still deferred |
| Fixed milestones, numerical SLOs, capacity targets | Withdrawn from active design | Measured workload and owner priorities |
| Product priority after OS-1 clarification | Shared presence and grounded context proposed for early evaluation | Real shared-attention conversation, ambiguity/correction and voice behavior |

The first iteration's concerns about unknown external effects, provenance, host isolation and deletion remain valid. Its particular schemas and infrastructure are historical proposals, not a checklist every module must implement.

## ADR-013 — Concrete local stack with module-owned SQLite

**Status:** proposed at the user's request for a specific stack.

**Decision:** TypeScript/Node 24, Zod, `better-sqlite3`, SQLite per module, FTS5 for initial Recall, Vitest for independent evaluation. Codex runs inside a rootless Podman workspace; the first conversational provider uses the OpenAI SDK. Fastify hosts interfaces only where needed. See [stack detail](module-internals-and-stack.md).

**Alternatives:** PostgreSQL would add a server before demonstrated need; raw JSON files alone make transactional revision/deletion handling harder. One shared database schema couples module internals. Different languages for every module add unnecessary integration overhead.

**Consequences:** a concrete default that each module can use alone. SQLite is not encrypted by default and is not a shared network database. Native dependency compatibility and short nonblocking storage work must be verified. FTS5 alone does not satisfy all eventual semantic recall requirements.

**Revisit:** migrate storage for measured concurrent-write/remote requirements; add semantic search based on failed recall cases. Module APIs and source ownership remain stable while implementation changes.

## ADR-014 — Memory tools, not direct database access

**Status:** proposed.

**Decision:** optional scoped MCP tools let a harness search/read evidence and propose additions. Recall owns validation, storage and promotion; a trusted caller can accept proposals initially. Conversation archives turns independently and optionally exports revisions to Recall.

**Alternatives:** mounting the memory DB exposes all data and bypasses policy. Letting any agent overwrite facts confuses inference with authority. Requiring an autonomous memory agent first creates another dependency before useful read/write behavior exists.

**Consequences:** the memory bridge needs a real access boundary and deletion/freshness handling when connected. A scoped token may be readable within the workspace but cannot grant broader access. Runs without Recall still work with supplied context and exported proposed notes.

**Revisit:** automate promotion of tested, low-risk categories or change transport for remote execution. Do not change the rule that agents access memory through controlled operations and source evidence.

## ADR-015 — Grounded presence is a product foundation

**Status:** proposal reflecting the owner's OS-1 reference and critique of ungrounded user stories.

**Problem:** “this customer,” “next call,” and similar examples presumed access and shared history that the four-module stack did not establish. The product framing also reduced natural conversation to a late surface on top of delegated tasks.

**Decision:** distinguish present shared attention, connected source state, conversation references and historical memory. Conversation owns bounded reference resolution; Recall supplies evidence/history; an explicit host observation adapter can supply permitted current context; Execution receives grounded resource references. Evaluate voice/shared attention early as a product experiment, independently of technical Execution qualification.

**Alternatives:** inventing implicit context is incorrect. Requiring manual attachments forever prevents the desired experience. Building a universal world-state platform before testing one shared interaction repeats the earlier overdesign.

**Consequences:** source capture/connectors and reference-resolution quality are explicit gaps, not hidden model capabilities. Four module boundaries remain. A supplied-context fixture can test interpretation but cannot validate a live observation integration. Existing technical exercises remain useful without defining the entire product order.

**Revisit:** refine placement and source adapters based on real shared-context experiments; retain source identity, freshness and honest uncertainty as invariants.
