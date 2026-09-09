# Candidate systems, stack, and integration boundaries

Architecture proposal · 2026-09-09. No dependencies have been installed or tested. [Research](research.md) distinguishes documented interfaces from assumptions; [qualification](review-and-roadmap.md) determines whether to adopt them.

## 1. Select a management foundation before building one

| Candidate | Documented relevance | Design judgment / remaining gap |
| --- | --- | --- |
| Paperclip | Goals, issues, heartbeats, agent adapters, review handoffs, PostgreSQL-backed application, private authenticated deployment | First candidate to evaluate against the owner's actual workflow; task hierarchy, mobile usability, subscription path, and recovery need testing |
| T3 Code | Existing remote interface to coding harnesses with web/mobile/desktop surfaces | Useful execution/review reference or optional companion; no assumption of a stable external coordination API or shared live-session ownership |
| Symphony | Issue-driven autonomous coding runs and isolated workspaces; reference implementation is an engineering preview | Narrow engineering alternative/reference; does not establish the entire product/reporting experience |
| Custom application with DBOS | DBOS supplies database-backed workflows, queues, and schedules | Conditional route if existing management products leave a concrete gap; custom work must be justified |

These are alternatives or bounded integrations, not four services to deploy together. Paperclip's marketed breadth is not proof of reliable task completion, enforced cost ceilings, or isolation.

## 2. Proposed route A: configure or extend Paperclip

Integrate its existing records, task ownership, adapters, and routines where qualification succeeds. Its documented Node/React/PostgreSQL architecture and authenticated private-network mode fit the proposed deployment shape.

Use supported extension/API surfaces. Do not modify its private tables from JARVIS, copy its entire task database into a competing writable store, or fork it merely to rename UI labels. Record a concrete extension gap before choosing a fork or separate application.

For this route:

- **INTEGRATE:** existing work management, persistence, native agent launch, schedules, logs, and review records where supplied.
- **BUILD/CONFIGURE:** small SaaS work templates and briefing rules; additional views/integrations only for observed gaps.
- **QUALIFY:** subscription authentication, retry behavior, readable review output, cross-device commands, resource boundaries, and provider-specific limitations.
- **EXCLUDE:** additional paid inference backend for planning; duplicate custom dispatch engine; automatic token copying or broad credential grants to make an adapter work.

Paperclip's budget display must not be assumed to represent subscription capacity. An unpriced run is not proof of unused quota or free unlimited work.

## 3. Conditional route B: small custom application

Only select this route through an ADR recording why route A is insufficient.

| Concern | Proposed choice | Ownership / constraint |
| --- | --- | --- |
| Application | TypeScript with a supported Node release; responsive web UI, React candidate | Runtime and exact framework versions selected during qualification |
| Persistent state | PostgreSQL | Logical module ownership inside one deployment; no agent SQL access |
| Durable execution | DBOS candidate | Integrate schedules, queue limits, checkpoints, and waits; no hand-built workflow engine |
| Harness integration | Codex App Server; Claude Code programmatic CLI | Existing execution loops and subscription authentication |
| Artifacts | Managed local files initially; remote object storage if needed | DB holds references/digests; Git owns code history |
| Environment | Existing container/VM/account facilities suited to the actual host | No OS desktop dependency; backend must establish advertised restrictions |
| Evaluation | Existing TypeScript test tooling and recorded fixtures | Pin a compatible toolchain later; fixtures cannot prove live auth/isolation |

For a single-host DBOS route, workflows recover from persisted checkpoints when the application restarts. Automatic failover across multiple hosts needs separate coordination and evaluation. A checkpoint does not resurrect a dead CLI or guarantee an external action happened once. Use the selected engine's facilities and reconcile native execution receipts before retrying.

The application can host domain modules together; the worker remains a restricted execution boundary. Start with one database service, not a vector service, event bus, and multiple mandatory databases.

## 4. Subscription-only provider boundary

All AI roles use the owner's subscribed harnesses: planner, implementer, researcher, reviewer, and report writer. Scheduling, status aggregation, context selection, and notification delivery use ordinary application code.

### Codex

The documented App Server supports managed ChatGPT authentication, session history/resumption, structured events, and rate-limit reporting. Prefer its supported local stdio transport for a direct integration. Its RPC interface is programmatic control of Codex, not a requirement to use an OpenAI API key.

Bind the adapter to the expected owner's ChatGPT account. Validate the actual authentication mode before dispatch. API-key and other metered provider configurations are outside the current design. The simpler non-interactive CLI can be used if its qualified lifecycle covers the required task; do not build both interfaces without need.

### Claude Code

Use the owner's supported Claude subscription login through native Claude Code. The current official subscription notice states that Agent SDK, ordinary claude -p, and third-party usage still draw from subscription limits after the announced change was paused. This must be rechecked against the installed version and current terms before adoption.

The documented bare mode does not read subscription OAuth/keychain credentials and requires a different authentication source; it is therefore excluded from the proposed subscription path. Do not assume all SDK/CLI modes preserve subscription billing.

API-key environment variables can override the native subscription login. Audit the selected adapter's credential precedence without printing secret values. Do not use a generic Anthropic API client, reverse-engineer subscription endpoints, or export subscription tokens into such a client.

### Admission and capacity

Subscription mode is an admission requirement. Account-level extra usage/top-ups must be off or otherwise reliably prevented for the chosen path. If the adapter cannot establish the required mode, it must report blocked authentication rather than choose a paid fallback.

Store provider-reported limits/reset times when available. Unknown usage is unknown, not zero. Bound concurrency and run duration conservatively where telemetry is absent; do not advertise an exact reserved quota that cannot be enforced. All sessions/subagents draw on the relevant account limits.

A quota wait retains the task, run evidence, and next eligible check. Provider switching, if enabled by the owner, creates a distinct attempt with a context handoff; it does not migrate a live session or bypass an account limit.

## 5. Remote access and environment placement

Integrate Tailscale for the owner's devices and SSH for administration. Tailscale Serve can expose the application and previews privately with HTTPS. Keep the application authenticated; network membership alone does not grant task/credential administration.

The proposed first topology is one available host with separately restricted execution resources. No existing always-on machine, Tailscale setup, or provider login has been inspected. Exact host OS, machine ownership, capacity, and runtime installation remain open.

Ordinary OS service management owns application startup, shutdown, and restart. tmux is useful for manual sessions and diagnosis, but does not provide durable task claims or crash recovery. Remote node dispatch is a later capability; SSH is not itself a job scheduler.

## 6. Optional surfaces and services

Telegram may send concise notifications and callback/link buttons tied to durable task IDs. WhatsApp remains an unevaluated idea. Neither is a prerequisite for cross-device browser use. Validate current policy and recheck authority before acting on any callback; an old message must not approve a newer artifact.

Existing Git hosting, CI, testing, and preview tools should produce inspectable receipts. External integrations are optional and need actual access; supplied reports can substitute during module evaluation.

No paid embedding, summarization, realtime voice, or manager-model service is included. Search and context start with project records and existing database/file primitives. Future features must preserve subscription-only AI execution unless the owner explicitly changes that constraint.
