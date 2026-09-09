# Architectural decisions and supersession

Updated 2026-09-09 following the owner's revised scope and authorization to modify architecture.

**Status convention:** User requirement means an explicit current constraint. Proposed means an engineering choice awaiting evidence/review. Deferred means outside the current target slice. None of these records authorizes implementation.

## Current decision ledger

| Topic | Status | Current direction |
| --- | --- | --- |
| Product | User requirement | Help a solo SWE build/operate SaaS through persistent project work and scheduled deliverables |
| AI execution | User requirement | Owner's subscription-authenticated Claude Code/Codex for every AI role; no metered API/fallback/extra spending |
| Access | User requirement | Tailscale, SSH, always-on execution intention, OS-agnostic product |
| Initial host | User-directed deployment decision | One rented VPS first; do not purchase dedicated hardware for the initial slice |
| Service packaging | User-directed deployment decision | Docker Compose for deployed services; containers are disposable and persistent state is backed up separately |
| Management foundation | Proposed | Evaluate Paperclip first; adopt/extend only if qualification succeeds |
| Persistence | Proposed | PostgreSQL for composed work state; no required shared service for standalone fixtures |
| Scheduling engine | Conditional proposal | Use selected foundation's mechanisms; DBOS only for a documented custom gap |
| UI | Proposed | Responsive project plan/board/Today/review inbox; work-scoped conversation |
| Environment | Open implementation choice | One qualified host and existing enforced isolation; no Omarchy prerequisite |
| Messaging | Deferred candidate | Telegram optional; WhatsApp unevaluated |
| Companion/voice/home | Deferred | Historical vision preserved, not initial requirements |
| Independent development | Retained constraint | Small supplied-input modules, few deployable components |

## ADR-016 — Recenter the product on solo SaaS project work

**Status:** user-directed scope; concrete UI and stories proposed.

**Context:** managing chat threads and manually prompting every assignment leaves the owner coordinating agents rather than progressing product work.

**Decision:** prioritize plans, executable queues, recurring deliverables, reviews, and persistent cross-device state. Use the Ben Davis inspiration for remote access and always-on execution. Preserve the original brief unchanged and label broader presence work historical/deferred.

**Alternatives/consequences:** a remote chat interface alone does not address planning and follow-up. A complete personal companion expands scope beyond the current need. Useful reports, accepted changes, and reduced coordination burden become the product tests.

**Supersedes/revisit:** supersedes ADR-015's early-product priority; revisit broader presence only on an explicit new product need.

## ADR-017 — Subscription-native AI execution only

**Status:** firm user requirement.

**Decision:** planning, implementation, research, review, and report writing all execute through the owner's authenticated Claude Code or Codex subscription path. Scheduling and bookkeeping are ordinary code. Exclude model API keys, a separate paid manager, paid embeddings/summaries, automatic extra usage, and paid fallback.

**Alternatives/consequences:** raw model APIs may be convenient but violate the owner's cost constraint. Native interfaces retain provider behavior and quota limits. Qualify the real authentication mode, account-level overage behavior, native version, and programmatic mode before dispatch. Wait for capacity/auth rather than silently changing billing.

**Supersedes/revisit:** replaces ADR-013's API conversation provider. Revisit only if the user changes this constraint. Vendor-mode changes trigger requalification, not permission to incur charges.

## ADR-018 — Evaluate an existing coordinator before building one

**Status:** proposed integration strategy; no platform selected.

**Decision:** evaluate Paperclip against the acceptance matrix. Use supported configuration/extensions where it fits. Keep T3 Code and Symphony as bounded comparison references. Select custom coordination only after a gap ADR records observed failure, alternatives, and maintenance cost.

**Alternatives/consequences:** immediately building a task manager/scheduler duplicates substantial existing work. Blind adoption risks a poor workflow or unsupported subscription path. Do not install multiple coordinators with competing ownership. Product documents describe required semantics without claiming Paperclip implements every one reliably.

**Revisit:** after a pinned-version evaluation of subscriptions, recurring work, result review, recovery, and second-device access.

## ADR-019 — Scheduled and event-driven deliverables are core

**Status:** user requirement for recurring work; detailed lifecycle proposed.

**Decision:** persist routine definitions and individual occurrences, expected outputs, coverage, authority, overlap/missed-run policy, and run history. Events and schedules feed the same eligibility checks. Work may advance within an authorized milestone without another owner prompt.

**Alternatives/consequences:** cron directly launching prompts lacks sufficient ownership/result semantics. A continuously reasoning manager spends capacity even without useful work. Prefer the adopted coordinator's durable primitives; DBOS is a conditional option for custom workflows, not an automatic addition.

**Revisit:** actual overlap, recovery, or wait failures determine additional machinery. Workflow recovery never implies guaranteed exactly-once external effects.

## ADR-020 — Persistent project records with explicit ownership

**Status:** persistent state is required; PostgreSQL and record layout proposed.

**Decision:** model tasks separately from attempts, routine definitions from occurrences, and deliverables from verification/review/release receipts. PostgreSQL is a candidate for composed shared state. Preserve module write ownership and support supplied snapshots for independent evaluation. Adopted platform records remain authoritative.

**Alternatives/consequences:** per-module SQLite is no longer the composed default, but remains a possible standalone/test choice. A duplicate bidirectionally writable backlog creates conflicts. Full personal memory or a vector service is unnecessary for initial project continuity.

**Supersedes/revisit:** supersedes ADR-013's storage default. Revisit on actual selected-platform requirements and measured workload, not database preference alone.

## ADR-021 — Private remote access without a desktop dependency

**Status:** user-directed access/OS direction; topology proposed.

**Decision:** use Tailscale and SSH around an always-on execution host, with authenticated web access. Keep management state outside agent environments. Qualify one host/backend first; expose real supported capabilities.

**Alternatives/consequences:** keeping work tied to a laptop defeats the desired continuity. Requiring Omarchy excludes otherwise suitable hosts. Supporting every OS/backend initially adds unproven complexity. A single host is not highly available, and SSH/tmux alone do not provide task recovery.

**Revisit:** actual host selection and later measured need for additional workers; multi-host failover requires its own evaluation.

## ADR-022 — Evidence, review, and authority are explicit

**Status:** retained engineering constraint; proposed workflow.

**Decision:** each run carries existing scope; each deliverable/check/decision targets an exact revision. Native completion, verification, acceptance, merge, and deployment remain distinct. Reconcile uncertain actions before retry. Validate authority and revision on every device/callback.

**Alternatives/consequences:** treating a confident final message as task completion loses trust. Requiring owner confirmation for every command recreates micromanagement. Standing authority supports automatic reversible work; separate action scope governs publication when not already authorized.

**Revisit:** add release automation only when its required checks/receipts and authority are established.

## ADR-023 — Keep independent evaluation while changing module boundaries

**Status:** independent development retained; responsibility map proposed.

**Decision:** preserve ADR-011's supplied-input principle. Project work, coordination, execution, environments, and context/presentation can be evaluated independently; they need not be separate services or replacements for adopted capabilities. No API-funded Conversation module or mandatory four-package layout.

**Alternatives/consequences:** a full platform prerequisite delays useful evidence. Retaining the old four modules as immutable product boundaries hides the now-central coordination need. Use fixtures to develop one boundary and live tests for actual integration.

**Supersedes/revisit:** ADR-012's single execution exercise remains useful qualification but is not sufficient product validation. Evaluate scheduled work and remote review in the first composed slice.

## ADR-024 — Start the minimal deployment on a rented VPS with Docker Compose

**Status:** user-directed deployment decision.

**Context:** buying a dedicated mini-PC assumes sustained use and up-front cost before the workflow has demonstrated value. The owner prefers a cheap, always-on remote host that can be stopped, resized, or replaced.

**Decision:** begin with one rented VPS. Access it privately through Tailscale and administer it with SSH. Package deployed services through Docker Compose. Preserve durable records, configuration, artifacts, and backup/restore instructions outside disposable application containers. A Compose service boundary does not by itself make an agent task environment isolated.

**Consequences:** the VPS provider, region, operating system, size, and backup destination are implementation inputs. Shared-vCPU capacity must be observed under the actual workload, rather than inferred from a dashboard or minimum requirement. Destroying/recreating a VPS restores only the server when backed-up state is available; it does not reverse leaked credentials or external effects.

**Revisit:** reconsider a physical worker when recurring cost, storage, workload, or home-network locality makes it worthwhile. Reconsider Compose only when a specific deployment/recovery requirement demonstrates that it is insufficient.

## Historical decisions retained for provenance

The text below records the 2026-09-07 design, not current defaults. The earlier full package is in Git commit 6f3b41c8b0cb7bfcf7a48e6a95785f01a579c561.

| Historical ADR | Current treatment |
| --- | --- |
| ADR-011 | Independent-development principle retained through ADR-023; fixed four-module map revised |
| ADR-012 | Retained as technical exercise; first product slice superseded by ADR-016/019/023 |
| ADR-013 | Stack/API/storage defaults superseded by ADR-017/020/021 |
| ADR-014 | Scoped source access/proposals retained as pattern; a separate memory service is not required |
| ADR-015 | Presence priority deferred by ADR-016; source grounding retained |

---

### Historical record: decisions and deliberate deferrals

Updated 2026-09-07 after the user endorsed the four modules and requested concrete subdivisions and stack choices. The first iteration's ten proposed ADRs are preserved in Git commit `300b7c3`; they were never accepted implementation requirements. Their stack/topology choices are superseded by this record. The research evidence remains available separately.

### ADR-011 — Independent modules before a shared platform

**Historical status (superseded or retained as mapped above):** governing design direction requested by the user; the particular module boundaries remain proposed.

**Problem:** iteration 1 required shared tasks, permissions, workflows, storage and orchestration before a useful part could be evaluated. It selected an eventual system too early.

**Decision:** every module must accept supplied input, produce observable output and have a standalone evaluation that requires no other unfinished JARVIS module. Build only the connection needed by a real use case. Manual callers and prepared resources are valid starting points.

**Alternatives:** building the shared core first retains the original dependency problem. Turning every module into a service merely distributes it. Treating integration tests as substitutes for module evaluation prevents understanding which boundary failed.

**Consequences:** some setup is initially manual. A standalone exercise proves limited behavior; real integration still needs evaluation. Module internals and small contracts may change as evidence arrives.

**Revisit:** adjust module boundaries when an actual consumer exposes friction; preserve independent evaluability as the criterion.

### ADR-012 — Execution as the first exercise

**Historical status (superseded or retained as mapped above):** recommendation, not an implementation authorization or mandatory project order.

**Decision:** first evaluate a bounded repository-analysis request through one existing harness against a prepared isolated location. Provisionally use Codex because prior research found a suitable structured integration surface. Do not build memory, environment provisioning or automated planning for this exercise.

**Alternatives:** Recall is also an independently valid starting point if memory is the user's immediate priority. A full voice-to-code flow obscures which integration works and introduces several unfinished dependencies.

**Consequences:** this proves the execution seam, not the whole JARVIS product. Credentials and actual isolation remain required. A second provider is useful only when testing replaceability or meeting a concrete capability need.

**Revisit:** change the first exercise or provider if the available host/account or user priority makes another path more informative.

### Decision ledger

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

### ADR-013 — Concrete local stack with module-owned SQLite

**Historical status (superseded or retained as mapped above):** proposed at the user's request for a specific stack.

**Decision:** TypeScript/Node 24, Zod, `better-sqlite3`, SQLite per module, FTS5 for initial Recall, Vitest for independent evaluation. Codex runs inside a rootless Podman workspace; the first conversational provider uses the OpenAI SDK. Fastify hosts interfaces only where needed. See [stack detail](module-internals-and-stack.md).

**Alternatives:** PostgreSQL would add a server before demonstrated need; raw JSON files alone make transactional revision/deletion handling harder. One shared database schema couples module internals. Different languages for every module add unnecessary integration overhead.

**Consequences:** a concrete default that each module can use alone. SQLite is not encrypted by default and is not a shared network database. Native dependency compatibility and short nonblocking storage work must be verified. FTS5 alone does not satisfy all eventual semantic recall requirements.

**Revisit:** migrate storage for measured concurrent-write/remote requirements; add semantic search based on failed recall cases. Module APIs and source ownership remain stable while implementation changes.

### ADR-014 — Memory tools, not direct database access

**Historical status (superseded or retained as mapped above):** proposed.

**Decision:** optional scoped MCP tools let a harness search/read evidence and propose additions. Recall owns validation, storage and promotion; a trusted caller can accept proposals initially. Conversation archives turns independently and optionally exports revisions to Recall.

**Alternatives:** mounting the memory DB exposes all data and bypasses policy. Letting any agent overwrite facts confuses inference with authority. Requiring an autonomous memory agent first creates another dependency before useful read/write behavior exists.

**Consequences:** the memory bridge needs a real access boundary and deletion/freshness handling when connected. A scoped token may be readable within the workspace but cannot grant broader access. Runs without Recall still work with supplied context and exported proposed notes.

**Revisit:** automate promotion of tested, low-risk categories or change transport for remote execution. Do not change the rule that agents access memory through controlled operations and source evidence.

### ADR-015 — Grounded presence is a product foundation

**Historical status (superseded or retained as mapped above):** proposal reflecting the owner's OS-1 reference and critique of ungrounded user stories.

**Problem:** “this customer,” “next call,” and similar examples presumed access and shared history that the four-module stack did not establish. The product framing also reduced natural conversation to a late surface on top of delegated tasks.

**Decision:** distinguish present shared attention, connected source state, conversation references and historical memory. Conversation owns bounded reference resolution; Recall supplies evidence/history; an explicit host observation adapter can supply permitted current context; Execution receives grounded resource references. Evaluate voice/shared attention early as a product experiment, independently of technical Execution qualification.

**Alternatives:** inventing implicit context is incorrect. Requiring manual attachments forever prevents the desired experience. Building a universal world-state platform before testing one shared interaction repeats the earlier overdesign.

**Consequences:** source capture/connectors and reference-resolution quality are explicit gaps, not hidden model capabilities. Four module boundaries remain. A supplied-context fixture can test interpretation but cannot validate a live observation integration. Existing technical exercises remain useful without defining the entire product order.

**Revisit:** refine placement and source adapters based on real shared-context experiments; retain source identity, freshness and honest uncertainty as invariants.
