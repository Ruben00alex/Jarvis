# System responsibilities and composition

Current proposal · 2026-09-09 · See [decision status](decisions.md). These boundaries guide evaluation; they are not a mandate to implement a replacement for Paperclip.

## Product and runtime separation

The project application owns the owner's view of objectives, tasks, decisions, and results. Clients attach to it; closing a browser does not stop work. The execution host must remain available for work to progress. Model/harness sessions can end without losing the management record.

Ordinary application code maintains schedules, dependencies, permissions, run claims, and delivery state. A planning or reporting assignment invokes the same subscribed Claude Code/Codex execution boundary as implementation. No separate model API client is part of the design.

The composition needs durable shared project state. Independent development does not: each boundary accepts fixtures or supplied records, and only live integration exercises need the real external services.

## Responsibility map

| Responsibility | Owns | Standalone input and observable output |
| --- | --- | --- |
| Project work | Objectives, milestone scope, tasks, dependencies, policy references, revisions | Supplied brief and task records → proposed/accepted plan and eligible-work view |
| Coordination | Routine occurrences, dispatch eligibility, task claims, retry/capacity waits, reconciliation | Clock/events, task snapshot, fake executor → auditable dispatch decisions without LLM use |
| Execution | Native session references, per-attempt progress, supported steering, outcome collection | Supplied assignment and prepared environment → run events, result, native references |
| Environments | Owned execution resources, actual restrictions, lifecycle, preview process ownership | Resource profile and fixture → inspected descriptor, exports, observed stop/release |
| Context and deliverables | Source revisions, scoped context bundles, result versions, evidence, decision references | Exported sources/run receipts → inspectable report inputs and deliverables |
| Client presentation | Board, Today view, work discussions, review actions, stale-state indicators | Recorded state/events → usable interface and validated commands |

These can be modules in one application or capabilities supplied by an integrated product. Do not create a service or package solely for every table row.

## Project work and planning

The owner sets objectives and executable scope. A planning run may propose decomposition, prioritize within standing authority, find missing requirements, and prepare a decision. The work boundary validates and records changes. Task creation can be authorized without authorizing execution; execution can be authorized without authorizing publication.

A task is the durable unit of work. A run is an attempt through one native provider. Many runs can contribute to one task; one deliverable may require multiple checks or revisions. Provider-native subagents remain inside the harness's run unless their result needs an explicit task relationship.

Every task points to a project and purpose. Parent/child relationships help explain why it exists; dependency edges identify prerequisites. Detect cycles and expose ambiguity instead of letting the planner create permanently blocked work.

## Coordination without a new agent loop

On a schedule, work-state change, or relevant external event:

1. Read fresh project/routine state and check whether useful work exists.
2. Check scope, dependency acceptance, credentials, capacity, and workspace availability.
3. Claim eligible work using the selected coordinator's concurrency mechanisms.
4. Supply a bounded assignment and native context reference to Execution.
5. Collect outcome and verification evidence; update the task or create a review item.
6. Schedule justified follow-up or wait for an external change.

This describes product orchestration, not the harness's inspect/edit/test loop. Prefer an existing coordinator for dispatch and recovery. If Paperclip supplies those mechanisms, use its records and APIs rather than running a competing scheduler.

Automatic continuation rechecks current scope. A parent agent declaring success alone does not unlock work that depends on an accepted or verified result. Parallelize independent assignments; serialize conflicting changes or integration into the shared branch.

## Execution and environments

A thin adapter launches or resumes the actual subscribed harness using a supported native interface. It retains native capabilities and declares limitations: pause, steer, resume, usage reporting, and structured output are not assumed uniform.

A prepared environment can be supplied manually. Its descriptor identifies the host, repository/worktree, actual isolation, credential binding, and supported lifecycle. Git worktrees separate changes; they do not restrict filesystem, network, or credential access. A container, VM, or restricted account supplies the required resource boundary using existing OS tooling.

The worker should not receive database administration credentials or control of the management host. Per-project task tools expose narrow operations where live context/updates are needed. A static bundle is sufficient for initial execution qualification.

Preview processes have their own owner and lifecycle. Do not assume a dev server survives the coding CLI's exit. The selected environment system must manage it and report its live URL/expiry independently.

## Context, evidence, and presentation

Project context consists of actual briefs, decisions, tasks, customer notes, repository revisions, and artifacts. Explicit scope and source timestamps distinguish historical records from fresh observations. Search can start with known references and lexical queries. Model-assisted synthesis still uses subscribed harnesses.

The UI shows artifact-first results with native transcripts available beneath them. A stored dashboard does not require inference to render. A failed prose briefing leaves the ordinary project status accessible.

Multiple clients use the same server-side records. Commands carry revision and retry identity; a stale phone action cannot silently overwrite a newer laptop decision. Disconnection shows last known state until synchronization resumes.

## Placement and development independence

A proposed first deployment is one always-on host running the management application and persistent store, plus a separate restricted execution environment on that host. Tailscale provides private device connectivity and SSH provides administration. The management service outlives client connections and must not depend on an interactive SSH session.

OS-agnostic means the product contracts and web access do not require Omarchy. It does not promise identical native sandbox/CLI support on Windows, macOS, and Linux. Qualify one real target first; other hosts can implement the same bounded capabilities later.

Each responsibility has supplied-input evaluation in [the qualification plan](review-and-roadmap.md). Use fixtures for planning outputs, a fake clock/executor for coordination, and a prepared environment for execution. The first useful module need not wait for an unfinished dashboard, database abstraction, or memory subsystem.

## BUILD, INTEGRATE, OPTIONAL

- **INTEGRATE first:** project/agent coordination where Paperclip fits; native harnesses; database; OS isolation; Git and existing checks; private networking.
- **BUILD only a demonstrated gap:** SaaS playbooks, source-to-deliverable mapping, owner-specific report/review behavior, or thin boundary glue.
- **OPTIONAL/REPLACEABLE:** Paperclip implementation, custom workflow library, exact frontend/runtime, storage deployment, notification channel, and later remote worker transport.

The build-versus-integrate decision remains open until observed results show which capabilities the chosen foundation actually supplies.
