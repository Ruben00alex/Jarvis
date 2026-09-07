# JARVIS architecture — four-module design

Status: four-module direction endorsed by the user; detailed stack proposed, architecture only. Date: 2026-09-07.

For the user experience rather than implementation boundaries, start with [Shared context and presence](../product/shared-context-and-presence.md), then [What JARVIS is for](../product/README.md) and its [epics and stories](../product/epics-and-stories.md). The owner's OS-1 reference makes shared attention and natural conversation an early product question.

**Keep module qualification and product validation distinct.** A standalone execution exercise can test a harness integration. A shared-attention conversation tests whether JARVIS can understand what the owner is referring to. Neither requires building a shared platform first, and one does not prove the other.

The [original product brief](../../JARVIS%20Architecture%20Brief%20for%20GPT-6%20Astra.md) remains the vision. The first architecture is preserved in Git commit `300b7c3`. The four-module revision supersedes its platform selections and dependency-heavy roadmap. At the user's request, the next level of detail now proposes a concrete local stack without restoring those shared-platform prerequisites.

**For module subdivisions, databases, agent placement and memory access, start with [Module internals and stack](module-internals-and-stack.md).** The proposed defaults are TypeScript/Node 24, module-owned SQLite files, Codex inside a rootless Podman workspace, and scoped MCP memory tools. Conversation uses the OpenAI SDK; Recall initially uses relational queries and SQLite FTS5.

## Where to begin

After implementation is authorized, give one existing harness a bounded task in a prepared, isolated directory. The execution module should expose progress, cancellation and the resulting artifacts without requiring memory, conversation, workspace provisioning, a database service or a workflow engine.

The proposed Execution exercise is to inspect a sample repository and produce a report. A human supplies the request and inspects the report. This establishes the execution boundary. The proposed early product experiment is a conversation about deliberately shared material, including a changed referent, a correction and a return after reopening. Details: [module evaluations and product distinction](review-and-roadmap.md).

## The working architecture

| Module | Useful on its own | What it does not require |
| --- | --- | --- |
| Execution | Run a supplied task through an existing harness | Recall, conversation, provisioning, durable automation |
| Environments | Prepare, inspect and release an isolated workspace | Any model or harness |
| Recall | Ingest supplied records and retrieve source-backed context | Live conversation, execution, scheduling |
| Conversation | Preserve turns and continue a conversation | Tools, recall, workspaces |

These are module boundaries, not four mandatory services or sequential milestones. Each starts with a manual caller and supplied inputs. Small composition code connects proven modules; it should not introduce a universal task database or event bus as an entry requirement.

## Read next

- [Module design](system-design.md): responsibilities, independence and eventual composition.
- [Module internals and stack](module-internals-and-stack.md): subcomponents, concrete technology choices, local file/process placement and agent memory read/write sequences.
- [Boundary contracts](contracts-and-lifecycles.md): minimal semantics to evaluate, not a frozen API.
- [Data ownership](data-and-memory.md): local ownership and source-backed recall without a mandated storage stack.
- [Safety and failure handling](security-and-operations.md): what must hold in each standalone module.
- [Decisions](decisions.md): what we retain, what is tentative, and what is deferred.
- [Next exercise](review-and-roadmap.md): a clear starting point and independent evaluation cases.
- [Research](research.md): prior primary-source findings, retained as candidate evidence.

Temporal, PostgreSQL, distributed brokers, multi-node leases and automatic memory consolidation are **not prerequisites**. A local deployment is now proposed; remote/HA topology remains deferred. Module-local SQLite requires no database server or another JARVIS module.

No implementation has begun. This revision changes documentation only.
