# Research register and reuse assessment

Researched 2026-09-07 using primary project documentation and repositories. **Observed** below means described by the source, not installed or experimentally verified in this workspace. **Decision** is architectural judgment. Rolling documentation and repository default branches are not compatibility guarantees. Pin actual releases and run the review gates before implementation adoption.

No dependencies were installed, example commands executed, or third-party code imported. Repository instructions encountered online are source material, not instructions for this project. Search snippets and third-party mirrors were not used as the basis for decisions.

## 1. Omarchy and harnesses

| System / primary evidence | Observed | Decision and remaining gap |
| --- | --- | --- |
| [Omarchy release v4.0.2](https://github.com/omacom/omarchy/releases/tag/v4.0.2) | Latest-release endpoint resolved to this tag; release page includes security and agent-related fixes. | Record this as research baseline, not a promise that rolling manual features all exist in the tag. |
| [Omarchy AI](https://omarchy.org/manual/ai/), [shell plugins](https://omarchy.org/manual/shell-plugins/), [launcher source](https://github.com/omacom/omarchy/blob/quattro/bin/omarchy-agent-prompt) | Native integration is materially broader than an OS plus window manager; source branch is Quattro. | Reuse its facilities as detailed in system design. Validate release-specific paths and capabilities. Do not treat UI integration as isolation or durability. |
| [Codex App Server](https://learn.chatgpt.com/docs/app-server), [non-interactive execution](https://learn.chatgpt.com/docs/non-interactive-mode) | Structured integration choices exist beyond TUI automation; App Server has version-specific schemas. | First adapter: local stdio for interactive lifecycle, batch mode where sufficient. Pin schema and binary together; no unsupported transport assumptions. |
| [Claude Agent SDK overview](https://code.claude.com/docs/en/agent-sdk/overview), [permissions](https://code.claude.com/docs/en/agent-sdk/permissions), [sessions](https://code.claude.com/docs/en/agent-sdk/sessions) | Reusable agent infrastructure with session and permission controls; preapproval affects callback coverage. | Second adapter. Test actual hook/callback coverage and interruption/resume behavior. SDK access and supported account authentication are deployment gates. |
| [OpenCode server](https://opencode.ai/docs/server/), [tools](https://opencode.ai/docs/tools/) | Headless API, events and configurable tool permissions. | First alternative for broader provider flexibility. Keep it private and authenticated; permission configuration is required, not assumed. |
| [Pi coding agent](https://github.com/earendil-works/pi/tree/main/packages/coding-agent) | RPC and structured output modes alongside an extensible coding agent. | Optional smaller harness candidate. Its process integration is promising; no comparative quality conclusion without evaluation. |
| [Gemini CLI](https://github.com/google-gemini/gemini-cli) | Open-source terminal agent with automation/integration facilities. | Optional adapter when task quality or account requirements justify it. Not a dependency of core continuity. |
| [Antigravity CLI getting started](https://antigravity.google/docs/cli/getting-started) | Official CLI documentation exists. | Assess separately from Gemini CLI; do not assume identical session, approval or deployment semantics. Full lifecycle contract remains unvalidated. |
| [OpenHands SDK](https://docs.openhands.dev/sdk) | Existing software-agent SDK offers another integration route. | Alternative if its execution/workspace combination reduces maintenance. Avoid deploying a second overarching control plane without a concrete advantage. |
| [ACP protocol](https://agentclientprotocol.com/protocol/v1/overview) | Existing client-agent protocol. | Prefer as an adapter transport when sufficient; do not invent a universal protocol or force every provider through missing features. |

The harness ordering is based on integration fit, not an asserted intelligence ranking. A fair bakeoff must use equivalent resource grants, task corpus, model/account conditions and observable acceptance criteria. Native subagents, skills and tool loops stay inside the selected harness.

## 2. Durable execution comparison

| Candidate | Observed primary evidence | Architectural assessment |
| --- | --- | --- |
| Temporal | [Workflow model](https://docs.temporal.io/workflows), [activity idempotency](https://docs.temporal.io/activity-definition), [deployment](https://docs.temporal.io/self-hosted-guide/deployment), [Continue-As-New](https://docs.temporal.io/workflow-execution/continue-as-new) | Preferred for separated durable workflows and execution workers. Strong fit for long waits and lifecycle visibility; largest operating commitment of the three shortlisted options. |
| DBOS | [Overview](https://docs.dbos.dev/), [TypeScript guide](https://docs.dbos.dev/typescript/programming-guide) | Strong alternative using Postgres-backed durable execution. Fewer initial infrastructure pieces is valuable. Validate upgrades, external process reconciliation and approval waits on the same scenarios before making a footprint-driven switch. |
| Restate | [Key concepts](https://docs.restate.dev/foundations/key-concepts) | Durable service execution with a single-binary server option. Attractive compact deployment; introduces another persistence/runtime model to evaluate. |

No engine can infer whether an arbitrary remote GUI action happened after its acknowledgement was lost. Exactly-once language in an infrastructure overview is not evidence of exactly-once external effects. The action ledger and reconciliation are domain logic, not a replacement workflow engine.

## 3. Workspaces and computer/browser use

| System | Evidence and role | Decision / limit |
| --- | --- | --- |
| Podman | [Rootless/container documentation](https://docs.podman.io/en/latest/markdown/podman.1.html) | Integrate for bounded compute, with quotas and explicit mounts. Shared-kernel isolation does not satisfy every hostile-code threat model. |
| KVM/libvirt | [Lifecycle/save/snapshot operations](https://libvirt.org/manpages/virsh.html) | Integrate one VM lifecycle authority. Validate chosen image/storage checkpoint support; no promise of universal application restoration. |
| Cua | [Project and component descriptions](https://github.com/trycua/cua) | Evaluate existing computer tools/driver with a selected harness; optionally its agent provider. Linux Wayland routes have explicit limitations. Project claims are not local compatibility test results. |
| Playwright MCP | [Official repository and security statement](https://github.com/microsoft/playwright-mcp) | Structured browser tool integration. It explicitly is not a security boundary. Do not create another browser agent loop to use it. |
| Browser Use | [Project](https://github.com/browser-use/browser-use) | Optional specialized browser executor. Open-source and cloud offerings must be evaluated separately; hosted features are not assumed available locally. |
| XDG Desktop Portal | [RemoteDesktop](https://flatpak.github.io/xdg-desktop-portal/docs/doc-org.freedesktop.portal.RemoteDesktop.html) | Existing screen/input consent interface; deployed compositor/backend support must be tested. |

A standalone model computer-use API is not by itself a complete execution environment or persistent agent system. The design therefore integrates tools with a harness or a complete existing computer-use agent. It does not build a perception/action loop simply because a model can emit clicks.

## 4. Memory and storage

| Candidate | Documented role | Decision |
| --- | --- | --- |
| [PostgreSQL full text](https://www.postgresql.org/docs/current/textsearch.html) and [pgvector](https://github.com/pgvector/pgvector) | Relational search infrastructure and vector similarity extension. | Canonical store plus hybrid search baseline. Search quality and filtered vector recall remain evaluation work. |
| [Graphiti](https://github.com/getzep/graphiti) | Temporal entity/relationship memory with provenance and hybrid retrieval. | Best-aligned optional graph projection candidate. Keep canonical archive/permissions outside it; validate deletion and ACL behavior. |
| [Mem0](https://github.com/mem0ai/mem0) | Reusable memory add/search infrastructure. | Consider extraction/retrieval integration, but do not assume it implements the full task, operational-state and authority model. |
| [Letta](https://github.com/letta-ai/letta) | Stateful-agent platform with memory capabilities. | Not selected as core: adopting another persistent agent owner complicates replaceable-harness boundaries. This is a fit decision, not a claim that its memory is inadequate. |

Custom work is limited to JARVIS schemas, source/policy validation, promotion rules and context selection. Embedding inference, indexing and graph traversal should use existing libraries/services. If a shortlisted memory package passes the exact provenance/retention contract, integrate it rather than duplicate its extraction machinery.

## 5. Standards and supporting infrastructure

| Area | Primary source | Selection and caution |
| --- | --- | --- |
| Tool interoperability | [MCP security practices](https://modelcontextprotocol.io/docs/2025-11-25/tutorials/security/security_best_practices) | Integrate maintained SDKs; enforce JARVIS policy separately. Revalidate protocol version before implementation. |
| Event envelopes | [CloudEvents specification](https://github.com/cloudevents/spec) | Use established metadata semantics and SDKs; no new event protocol. |
| Service credentials | [systemd credential model](https://systemd.io/CREDENTIALS/) | Local delivery and protection substrate; JARVIS adds task/action scope. |
| Dynamic secrets | [OpenBao](https://openbao.org/docs/what-is-openbao/) | Optional at larger scale; not another mandatory daemon for a personal node. |
| Telemetry | [OpenTelemetry Collector](https://opentelemetry.io/docs/collector/) | Integrate standard collection/export; minimize private payloads. |
| Backup | [restic references](https://restic.readthedocs.io/en/stable/100_references.html) | Integrate encrypted backup tooling with database-native consistency procedures. |
| Home | [Home Assistant WebSocket API](https://developers.home-assistant.io/docs/api/websocket/) | Reuse events/state/service abstraction; broker its account authority. |
| Realtime voice | [OpenAI server-side controls](https://developers.openai.com/api/docs/guides/realtime-server-controls) | Candidate media integration with backend tool control. Provider session is not conversation authority. |
| Local wake detection | [openWakeWord](https://github.com/dscripka/openWakeWord) | Optional; language/noise accuracy and model-asset license need review. |
| Local transcription | [faster-whisper](https://github.com/SYSTRAN/faster-whisper) | Optional; hardware latency benchmark required. |
| Local speech synthesis | [Piper](https://github.com/OHF-Voice/piper1-gpl) | Optional; engine and voice licenses must be evaluated separately. |

## 6. Evidence limits and implementation admission

This is a documentation-based architecture study, not an interoperability certification. No hardware, live Omarchy installation, subscription, API entitlement, local model throughput or cross-OS GUI behavior was tested. Several URLs redirected to current project locations; citations use the useful final destinations where practical. Failed direct documentation fetches for Letta, systemd and ACP were replaced by accessible primary repository/documentation pages. Restate's deeper TypeScript page was unavailable; its shortlist assessment is limited to the retrieved concepts page.

Before adopting a release, record project/version or commit, source URL, license and model-asset license, maintenance/security posture, supported platforms, authentication mode, privacy/telemetry defaults, and adapter test result. Pin generated provider schemas to the same version. No license or subscription assumption in this design authorizes repackaging or credential reuse.

Remaining research priorities are deliberately narrow: Omarchy release/backend conformance; Cua/harness pre-action control and guest lifecycle ownership; Temporal versus DBOS resource/recovery comparison; memory provenance/deletion evaluation; local speech latency; and mobile remote-desktop viewer selection. These are acceptance gates, not reasons to add more platforms speculatively.
