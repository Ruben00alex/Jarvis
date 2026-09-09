# Research evidence and candidate qualification

Current direction · 2026-09-09. Primary sources were reviewed during the 2026-09-08–09 architecture discussion. This is a documentation review, not an installed integration test, billing test, security audit, or performance benchmark.

The source links below are rolling documentation/main-branch references. No execution release has been pinned. Before implementation, record the exact adopted release/commit and recheck authentication, license, lifecycle, and platform support. Vendor claims and design proposals must not be reported as verified deployment behavior.

## Current evidence register

| ID / primary source | Documented finding | Design use and qualification gap |
| --- | --- | --- |
| S1 — [Codex authentication](https://learn.chatgpt.com/docs/auth), [App Server](https://learn.chatgpt.com/docs/app-server) | Native ChatGPT authentication is distinct from API-key mode; App Server exposes managed login, native history/resumption, events, and rate-limit observations | Supports a subscription-native adapter candidate. Verify actual account/mode, installed schema, stop/resume, quota behavior, and no paid fallback |
| S2 — [Claude subscription and Agent SDK notice](https://support.claude.com/en/articles/15036540-use-the-claude-agent-sdk-with-your-claude-plan) | June 15 update says the announced billing changes are paused and Agent SDK, ordinary claude -p, and third-party usage still draw from subscription limits | Current support evidence, not a permanent guarantee. Read the update before the preserved obsolete announcement below it; recheck before adopting a mode |
| S3 — [Claude API-key precedence](https://support.claude.com/en/articles/12304248-manage-api-key-environment-variables-in-claude-code), [programmatic execution](https://code.claude.com/docs/en/headless) | An API-key environment variable can override a subscription login; documented bare mode does not load subscription credentials; CLI exit can terminate background shell tasks | Exclude incompatible modes. Check native auth without exposing secrets; manage preview processes separately. Do not assume an SDK name establishes subscription billing |
| S4 — [Paperclip repository](https://github.com/paperclipai/paperclip), [product definition](https://github.com/paperclipai/paperclip/blob/master/doc/PRODUCT.md) | Documents goals, tasks, heartbeats, work products/review handoffs and a Node/React application with PostgreSQL | Closest management candidate found, not selected. Test whether the workflow reduces administration and whether documented behavior works on a pinned version |
| S5 — [Paperclip adapters](https://github.com/paperclipai/paperclip/blob/master/docs/adapters/overview.md), [deployment modes](https://github.com/paperclipai/paperclip/blob/master/doc/DEPLOYMENT-MODES.md) | Native runtime adapters and private authenticated deployments are documented; adapter-specific credential topologies include remote/sandbox handling | Qualify the actual adapter/auth path and restrictions. No assumption that generic budget fields accurately represent subscription capacity or that copied credentials are inaccessible to task processes |
| S6 — [T3 Code](https://github.com/pingdotgg/t3code), [remote access](https://github.com/pingdotgg/t3code/blob/main/docs/user/remote-access.md) | Existing coding-agent interface with remote client surfaces | UI/execution reference or optional companion. A stable external task scheduler API and concurrent ownership of a live session have not been established |
| S7 — [Symphony](https://github.com/openai/symphony), [specification](https://github.com/openai/symphony/blob/main/SPEC.md) | Issue-driven agent orchestration and workspace lifecycle; reference implementation described as an engineering preview | Narrow coding-work alternative/reference. Not proof of a general SaaS management/reporting product or security isolation from directories alone |
| S8 — [DBOS architecture](https://docs.dbos.dev/architecture), [schedules](https://docs.dbos.dev/typescript/tutorials/scheduled-workflows), [steps](https://docs.dbos.dev/typescript/tutorials/step-tutorial) | PostgreSQL-backed queues/checkpoints and persisted schedules; single-node restart recovery; steps must be safe to retry | Conditional custom workflow candidate. Reconcile external launches/effects; distributed failover needs additional coordination. No automatic addition beneath another coordinator |
| S9 — [SSH over Tailscale](https://tailscale.com/docs/reference/ssh-over-tailscale), [Tailscale Serve](https://tailscale.com/docs/features/tailscale-serve) | Private network access for SSH and HTTPS exposure of local services to tailnet devices | Desired access foundation. Actual devices, application authentication, host availability, and preview access need qualification |
| S10 — [Telegram bot features](https://core.telegram.org/bots/features#inline-keyboards) | Callback/URL buttons can attach actions/navigation to messages | Optional decision notification surface. Authenticate actor and revalidate current work revision; no WhatsApp integration researched |

The [Ben Davis transcript](../../Ben%20Davis%20-%20Architecture%20inspo.md) was read in full. It motivates dedicated remote execution, a private network, project/machine instructions, session continuity, and preview links. Its hardware comparisons, vendor rankings, and agent-count anecdotes are not accepted architecture facts.

## What we infer, rather than claim the sources prove

- A project board and review inbox may reduce the owner's chat coordination burden.
- Paperclip is the first candidate worth qualifying; its company metaphor may be unnecessary overhead for this owner.
- One management application and one initial execution host may be sufficient.
- PostgreSQL now has a plausible role because schedules, attempts, and device-visible state must persist.
- A task-first context bundle may provide useful continuity without general personal memory.
- Scheduled and event-driven work should use ordinary eligibility checks before consuming subscription capacity.

These judgments require product and integration evidence. No subscription throughput, dollar saving, uptime target, or autonomous coding success rate has been measured.

## Requalification priorities

1. Native subscription paths for both providers, including programmatic flags, inherited environment, account-level extra usage, and policy changes.
2. The exact selected management release: schedules, claim/retry semantics, review versions, extension surfaces, and mobile access.
3. Actual environment/credential restrictions and preview ownership.
4. Quota/reset visibility and behavior when data is unavailable.
5. Recovery after lost launch acknowledgements, stale commands, and backup restore.

An unresolved requirement stays visible; it must not be solved by adding metered inference contrary to the user's instruction.

## Historical research register

The following 2026-09-07 material is retained as candidate history. Its local/API/voice defaults and statements about the next exercise are superseded by the current product and ADR-016–023. Listing a tool here does not make it an active dependency.

---

### Historical evidence and candidates

Primary sources were examined on 2026-09-07 during iteration 1 and supplemented for the requested module-level stack. The fuller initial research register is preserved in Git commit `300b7c3`. The [stack document](module-internals-and-stack.md) distinguishes proposed defaults from optional candidates.

This is documentation evidence, not an installed compatibility test or quality benchmark. Recheck the selected product's exact version, supported authentication, license and relevant boundary before implementation. A listing below does not make every candidate a dependency.

### Evidence for the proposed local defaults

| Primary source | What it supports / what remains untested |
| --- | --- |
| [Node release status](https://nodejs.org/en/about/previous-releases) | Node 24 is an LTS runtime; exact dependency compatibility still needs qualification. |
| [better-sqlite3](https://github.com/WiseLibs/better-sqlite3), [SQLite suitability](https://sqlite.org/whentouse.html) | Embedded Node storage choice; no database server required. Workload suitability is our design judgment. |
| [SQLite FTS5](https://www.sqlite.org/fts5.html), [WAL](https://www.sqlite.org/wal.html), [backup](https://www.sqlite.org/backup.html) | Search, concurrency and backup mechanisms; no claim of semantic retrieval, built-in encryption or network-file sharing. |
| [Zod](https://zod.dev/), [Fastify](https://fastify.dev/docs/latest/), [Vitest](https://vitest.dev/guide/) | Existing validation, interface-hosting and evaluation libraries instead of custom equivalents. |
| [MCP SDKs](https://modelcontextprotocol.io/docs/sdk) | Official implementation path for the optional stdio memory helper. SDK transport does not replace application source-scope checks. |
| [OpenAI quickstart](https://developers.openai.com/api/docs/quickstart), [Astra](https://developers.openai.com/api/docs/models/gpt-6-astra) | Official SDK/API and documented model ID for the proposed text provider; user account entitlement and latency/cost remain untested. |

### Execution candidates

| Source | Why it is relevant |
| --- | --- |
| [Codex App Server](https://learn.chatgpt.com/docs/app-server), [batch execution](https://learn.chatgpt.com/docs/non-interactive-mode) | Structured alternatives to terminal scraping. The initial execution exercise can choose the smallest adequate interface; richer lifecycle integration is available if needed. |
| [Claude Agent SDK](https://code.claude.com/docs/en/agent-sdk/overview), [permissions](https://code.claude.com/docs/en/agent-sdk/permissions) | Reusable harness; actual permission callback coverage must be checked. |
| [OpenCode server](https://opencode.ai/docs/server/) | Another programmatic execution surface, useful when provider flexibility is a requirement. |
| [Pi](https://github.com/earendil-works/pi/tree/main/packages/coding-agent) | RPC/structured integration candidate. |
| [Gemini CLI](https://github.com/google-gemini/gemini-cli), [Antigravity CLI](https://antigravity.google/docs/cli/getting-started), [OpenHands SDK](https://docs.openhands.dev/sdk) | Alternatives to investigate for a demonstrated need, not additional required adapters. |
| [ACP](https://agentclientprotocol.com/protocol/v1/overview) | Existing client-agent boundary to assess before inventing a common protocol. |

### Environment and interaction candidates

| Source | Why it is relevant |
| --- | --- |
| [Podman](https://docs.podman.io/en/latest/markdown/podman.1.html), [libvirt](https://libvirt.org/manpages/virsh.html) | Existing environment lifecycle/isolation machinery. Choose based on the real host and threat model. |
| [Cua](https://github.com/trycua/cua), [Playwright MCP](https://github.com/microsoft/playwright-mcp), [Browser Use](https://github.com/browser-use/browser-use) | Existing computer/browser interaction systems. Tool availability does not itself establish isolation or an action-scoped permission boundary. |
| [Omarchy AI](https://omarchy.org/manual/ai/), [plugins](https://omarchy.org/manual/shell-plugins/), [v4.0.2 research baseline](https://github.com/omacom/omarchy/releases/tag/v4.0.2) | Reuse native integration when exposing a working module. Unattended launch settings and plugin authority need explicit evaluation. Rolling docs may differ from a release. |
| [RemoteDesktop portal](https://flatpak.github.io/xdg-desktop-portal/docs/doc-org.freedesktop.portal.RemoteDesktop.html) | Standard host interaction interface; actual compositor support must be checked. |

### Recall candidates

| Source | Why it is relevant |
| --- | --- |
| [PostgreSQL search](https://www.postgresql.org/docs/current/textsearch.html), [pgvector](https://github.com/pgvector/pgvector) | Search/store options if the recall exercise needs them; no shared database prerequisite. |
| [Graphiti](https://github.com/getzep/graphiti), [Mem0](https://github.com/mem0ai/mem0), [Letta](https://github.com/letta-ai/letta) | Existing memory approaches to evaluate against source-backed retrieval and deletion needs before implementing custom machinery. |

### Deferred use cases

| When this need becomes concrete | Existing sources to return to |
| --- | --- |
| Durable waits and restartable workflows | [Temporal](https://docs.temporal.io/workflows), [DBOS](https://docs.dbos.dev/), [Restate](https://docs.restate.dev/foundations/key-concepts) |
| Cross-component tool authority | [MCP security](https://modelcontextprotocol.io/docs/2025-11-25/tutorials/security/security_best_practices), [systemd credentials](https://systemd.io/CREDENTIALS/), [OpenBao](https://openbao.org/docs/what-is-openbao/) |
| Voice | [Realtime server controls](https://developers.openai.com/api/docs/guides/realtime-server-controls), [openWakeWord](https://github.com/dscripka/openWakeWord), [faster-whisper](https://github.com/SYSTRAN/faster-whisper), [Piper](https://github.com/OHF-Voice/piper1-gpl) |
| Home actions | [Home Assistant API](https://developers.home-assistant.io/docs/api/websocket/) |
| Shared event/telemetry needs | [CloudEvents](https://github.com/cloudevents/spec), [OpenTelemetry](https://opentelemetry.io/docs/collector/) |
| Persistent data backup | [restic](https://restic.readthedocs.io/en/stable/100_references.html), plus the chosen store's consistency procedures |

The next research should answer a narrow question from the chosen module exercise. It should not expand the platform catalogue or freeze the final system before we can evaluate one part.
