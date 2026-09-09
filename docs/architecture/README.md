# JARVIS architecture: persistent SaaS project work

Revised 2026-09-09 · Architecture decisions and MVP handoff prepared.

**Current product:** a personal project-management workspace that helps a solo SWE plan, delegate, review, and continue SaaS work across devices. Scheduled assignments produce deliverables without requiring a fresh chat prompt each time.

The [current product brief](../product/README.md) captures the owner's revised direction. Preserve the [original architecture brief](../../JARVIS%20Architecture%20Brief%20for%20GPT-6%20Astra.md) unchanged. The [Ben Davis transcript](../../Ben%20Davis%20-%20Architecture%20inspo.md) motivates Tailscale, SSH, remote previews, and work independent of the laptop.

## Current decisions versus proposals

**User requirements:** subscription-only Claude Code/Codex for every AI role; persistent work beyond chat; scheduled deliverables and project-management assistance; remote access and always-on execution; OS-agnostic product. No paid model API or automatic extra usage.

**Current deployment decisions:** start with one rented VPS, accessed privately through Tailscale and administered with SSH. Use Docker Compose to package the deployed services and named volumes/backups for durable state. The VPS provider, region, size, operating system, and backup destination remain open.

**Proposals to qualify:** Paperclip as the existing management/coordinator foundation; PostgreSQL for composed state; a responsive web UI; thin provider integrations and existing environment tooling. DBOS is a conditional alternative for a proven workflow gap, not a second scheduler to add automatically. Paperclip adoption still depends on proving a subscription-authenticated Claude Code or Codex path.

## Shape of the system

~~~mermaid
flowchart TD
  UI["Browser on laptop or phone"] <--> APP["Project application: plans, board, reviews"]
  APP <--> STATE[("Durable project records")]
  APP <--> COORD["Coordination: routines, eligibility, dispatch"]
  COORD <--> EXEC["Execution adapter and worker"]
  EXEC <--> ENV["Task environment and subscribed harness"]
  EXEC --> RESULTS["Artifacts, checks, deliverables"]
  RESULTS --> APP
~~~

These are responsibilities, not six deployable services. Keep management state outside execution environments. Ordinary code owns schedules, task claims, policy, and delivery. Every model-assisted plan, report, review, and implementation runs through the owner's authenticated Claude Code or Codex.

## What changed

| Previous active proposal | Revised direction |
| --- | --- |
| Persistent companion and early voice/shared attention | SaaS project plans, work board, review inbox, and routines |
| Four fixed product modules: Execution, Environments, Recall, Conversation | Independently evaluable responsibilities aligned to project work; no mandated package count |
| Responses API text provider and optional background model calls | Subscription-authenticated harness execution for all AI work |
| Per-module SQLite as the composed default | PostgreSQL proposed where durable coordination and shared client state justify it; fixtures remain independent |
| Linux/Omarchy and Unix sockets as the primary product topology | OS-agnostic interfaces; qualify the actual execution host and native transport |
| Remote callers and durable timers deferred | Cross-device management and scheduled deliverables central to the target product |

Prior design is recoverable in Git commit 6f3b41c8b0cb7bfcf7a48e6a95785f01a579c561. [ADRs](decisions.md) preserve the historical decisions and record explicit supersession; the old scope must not leak back in as an implementation prerequisite.

## Reading order

| Document | Question it answers |
| --- | --- |
| [Product brief](../product/README.md) | What should improve for the owner? |
| [Stories](../product/epics-and-stories.md) | What behavior would establish usefulness? |
| [System design](system-design.md) | Which responsibility owns what? |
| [Stack and integration choices](module-internals-and-stack.md) | What can be reused, and what remains conditional? |
| [Contracts and lifecycles](contracts-and-lifecycles.md) | How does work advance, stop, and recover? |
| [Data and context](data-and-memory.md) | What persists and how does an agent receive it? |
| [Security and operations](security-and-operations.md) | How are subscription, authority, and failure boundaries enforced? |
| [Qualification and roadmap](review-and-roadmap.md) | What evidence selects a foundation and proves the first useful slice? |
| [Minimal VPS handoff](mvp-handoff.md) | What to provision, qualify, and demonstrate first? |
| [Decisions](decisions.md) | Which choices are firm, proposed, superseded, or deferred? |
| [Research](research.md) | Which primary sources support claims, and what is untested? |

The first implementation handoff is [Minimal VPS handoff](mvp-handoff.md). It starts with Paperclip qualification against one subscribed agent run, a recurring deliverable, and a second-device review. A failing integration case should produce a documented gap before custom infrastructure is selected.
