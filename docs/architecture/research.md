# Research evidence and candidates

Primary sources were examined on 2026-09-07 during iteration 1 and supplemented for the requested module-level stack. The fuller initial research register is preserved in Git commit `300b7c3`. The [stack document](module-internals-and-stack.md) distinguishes proposed defaults from optional candidates.

This is documentation evidence, not an installed compatibility test or quality benchmark. Recheck the selected product's exact version, supported authentication, license and relevant boundary before implementation. A listing below does not make every candidate a dependency.

## Evidence for the proposed local defaults

| Primary source | What it supports / what remains untested |
| --- | --- |
| [Node release status](https://nodejs.org/en/about/previous-releases) | Node 24 is an LTS runtime; exact dependency compatibility still needs qualification. |
| [better-sqlite3](https://github.com/WiseLibs/better-sqlite3), [SQLite suitability](https://sqlite.org/whentouse.html) | Embedded Node storage choice; no database server required. Workload suitability is our design judgment. |
| [SQLite FTS5](https://www.sqlite.org/fts5.html), [WAL](https://www.sqlite.org/wal.html), [backup](https://www.sqlite.org/backup.html) | Search, concurrency and backup mechanisms; no claim of semantic retrieval, built-in encryption or network-file sharing. |
| [Zod](https://zod.dev/), [Fastify](https://fastify.dev/docs/latest/), [Vitest](https://vitest.dev/guide/) | Existing validation, interface-hosting and evaluation libraries instead of custom equivalents. |
| [MCP SDKs](https://modelcontextprotocol.io/docs/sdk) | Official implementation path for the optional stdio memory helper. SDK transport does not replace application source-scope checks. |
| [OpenAI quickstart](https://developers.openai.com/api/docs/quickstart), [Astra](https://developers.openai.com/api/docs/models/gpt-6-astra) | Official SDK/API and documented model ID for the proposed text provider; user account entitlement and latency/cost remain untested. |

## Execution candidates

| Source | Why it is relevant |
| --- | --- |
| [Codex App Server](https://learn.chatgpt.com/docs/app-server), [batch execution](https://learn.chatgpt.com/docs/non-interactive-mode) | Structured alternatives to terminal scraping. The initial execution exercise can choose the smallest adequate interface; richer lifecycle integration is available if needed. |
| [Claude Agent SDK](https://code.claude.com/docs/en/agent-sdk/overview), [permissions](https://code.claude.com/docs/en/agent-sdk/permissions) | Reusable harness; actual permission callback coverage must be checked. |
| [OpenCode server](https://opencode.ai/docs/server/) | Another programmatic execution surface, useful when provider flexibility is a requirement. |
| [Pi](https://github.com/earendil-works/pi/tree/main/packages/coding-agent) | RPC/structured integration candidate. |
| [Gemini CLI](https://github.com/google-gemini/gemini-cli), [Antigravity CLI](https://antigravity.google/docs/cli/getting-started), [OpenHands SDK](https://docs.openhands.dev/sdk) | Alternatives to investigate for a demonstrated need, not additional required adapters. |
| [ACP](https://agentclientprotocol.com/protocol/v1/overview) | Existing client-agent boundary to assess before inventing a common protocol. |

## Environment and interaction candidates

| Source | Why it is relevant |
| --- | --- |
| [Podman](https://docs.podman.io/en/latest/markdown/podman.1.html), [libvirt](https://libvirt.org/manpages/virsh.html) | Existing environment lifecycle/isolation machinery. Choose based on the real host and threat model. |
| [Cua](https://github.com/trycua/cua), [Playwright MCP](https://github.com/microsoft/playwright-mcp), [Browser Use](https://github.com/browser-use/browser-use) | Existing computer/browser interaction systems. Tool availability does not itself establish isolation or an action-scoped permission boundary. |
| [Omarchy AI](https://omarchy.org/manual/ai/), [plugins](https://omarchy.org/manual/shell-plugins/), [v4.0.2 research baseline](https://github.com/omacom/omarchy/releases/tag/v4.0.2) | Reuse native integration when exposing a working module. Unattended launch settings and plugin authority need explicit evaluation. Rolling docs may differ from a release. |
| [RemoteDesktop portal](https://flatpak.github.io/xdg-desktop-portal/docs/doc-org.freedesktop.portal.RemoteDesktop.html) | Standard host interaction interface; actual compositor support must be checked. |

## Recall candidates

| Source | Why it is relevant |
| --- | --- |
| [PostgreSQL search](https://www.postgresql.org/docs/current/textsearch.html), [pgvector](https://github.com/pgvector/pgvector) | Search/store options if the recall exercise needs them; no shared database prerequisite. |
| [Graphiti](https://github.com/getzep/graphiti), [Mem0](https://github.com/mem0ai/mem0), [Letta](https://github.com/letta-ai/letta) | Existing memory approaches to evaluate against source-backed retrieval and deletion needs before implementing custom machinery. |

## Deferred use cases

| When this need becomes concrete | Existing sources to return to |
| --- | --- |
| Durable waits and restartable workflows | [Temporal](https://docs.temporal.io/workflows), [DBOS](https://docs.dbos.dev/), [Restate](https://docs.restate.dev/foundations/key-concepts) |
| Cross-component tool authority | [MCP security](https://modelcontextprotocol.io/docs/2025-11-25/tutorials/security/security_best_practices), [systemd credentials](https://systemd.io/CREDENTIALS/), [OpenBao](https://openbao.org/docs/what-is-openbao/) |
| Voice | [Realtime server controls](https://developers.openai.com/api/docs/guides/realtime-server-controls), [openWakeWord](https://github.com/dscripka/openWakeWord), [faster-whisper](https://github.com/SYSTRAN/faster-whisper), [Piper](https://github.com/OHF-Voice/piper1-gpl) |
| Home actions | [Home Assistant API](https://developers.home-assistant.io/docs/api/websocket/) |
| Shared event/telemetry needs | [CloudEvents](https://github.com/cloudevents/spec), [OpenTelemetry](https://opentelemetry.io/docs/collector/) |
| Persistent data backup | [restic](https://restic.readthedocs.io/en/stable/100_references.html), plus the chosen store's consistency procedures |

The next research should answer a narrow question from the chosen module exercise. It should not expand the platform catalogue or freeze the final system before we can evaluate one part.
