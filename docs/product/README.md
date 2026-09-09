# JARVIS: a workspace for a solo SaaS developer

Current direction · 2026-09-09 · Minimal VPS deployment selected; Paperclip remains to be qualified.

**Help Alex build and operate SaaS products by turning project goals into ongoing agent work and bringing useful results back for review.**

Alex is a software engineer who wants to spend more time choosing product direction, evaluating results, shipping, and learning from customers. Managing many chat threads, manually restarting every assignment, and reconstructing context across devices gets in the way. JARVIS should reduce that coordination work.

This direction supersedes the companion-first product in the previous revision. The [original architecture brief](../../JARVIS%20Architecture%20Brief%20for%20GPT-6%20Astra.md) remains unchanged. The [Ben Davis transcript](../../Ben%20Davis%20-%20Architecture%20inspo.md) supplies concrete inspiration: always-on remote development, Tailscale, SSH, curated machine/project instructions, and inspecting results from another device. Its demonstrations and product opinions are inspiration, not qualification evidence for our integration.

## Firm requirements and open choices

| Established by the user | Still proposed |
| --- | --- |
| Personal tool for building and operating SaaS products as a solo developer | Exact UI, component boundaries, and first project |
| Persistent project management beyond chat threads | Paperclip as the management foundation |
| Scheduled agent work and deliverables, including reports to read | PostgreSQL as the composed system's store |
| Remote, cross-device access; Tailscale, SSH, always-on execution | VPS provider, region, size, first execution OS, and backup destination |
| One rented VPS first, rather than buying always-on hardware | Paperclip adoption after subscription-path qualification |
| Docker Compose packages deployed services; durable data is separately backed up | Exact container/environment boundary for agent work |
| Claude Code and Codex using the owner's Claude and ChatGPT Pro subscriptions | Specific harness versions, adapters, and concurrency settings |
| No metered model API use, including manager/reporting cognition | DBOS only if a demonstrated custom workflow gap requires it |
| OS-agnostic product direction | Telegram/WhatsApp, additional worker hosts, richer previews |

No specific agent platform has been selected or tested. The management tool is for the owner's work; selling this tool or supplying model access to SaaS customers is outside this design.

## What the owner sees

| Surface | Purpose | Essential interaction |
| --- | --- | --- |
| Today | Changes since last visit across projects, deliverables due, blockers, decisions | Open the most useful result or resolve the next decision |
| Project plan | Objective, evidence, milestones, priorities, dependencies, definition of done | Discuss a proposal and make its scope executable |
| Work board | Proposed, Ready, Running, Review, Done, and explicit blocked/cancelled states | Prioritize, authorize eligible work, pause, or request changes |
| Deliverable inbox | Reports, research, previews, PR links, test evidence, and decisions | Accept, request revision, defer, or follow a link to detailed review |
| Routines | Recurring assignments, schedules, outputs, and execution history | Enable, edit, pause, run once, inspect last/next occurrence |
| Project knowledge | Briefs, customer evidence, decisions, setup instructions, prior results | Find and correct context without rebuilding it in chat |
| Run detail | Provider, host, observed progress, limitations, native session reference | Inspect, stop, steer where supported, or resume after reconciliation |

Conversation belongs to a project, milestone, task, or deliverable. A new device opens the same record. A project can contain discussion that never becomes an executable task.

The Today view must remain useful without an LLM call: ordinary code can show changed records and pending decisions. A prose briefing is an optional scheduled Claude Code/Codex assignment over those records.

## Planning help that reduces administration

A planning assignment can turn an objective into proposed tasks, identify missing acceptance criteria, explain dependencies, and recommend priorities. The planner is a role executed by a subscribed harness, not a separate paid inference service or a permanently running artificial executive.

Task creation and follow-up within an already authorized milestone may be automatic under the project's policy. A task title, chat suggestion, or move to a column alone does not silently confer unrestricted authority. The Ready action must show its meaning: eligible for execution under a named project policy and scope revision.

The owner should approve meaningful scope or product decisions, not each routine shell command. The application records applicable standing authority and carries it into future assignments. A planning agent cannot grant itself broader permissions, raise its usage allowance, or manufacture customer demand.

## Recurring work has a deliverable

A routine includes purpose, source/project scope, trigger, timezone, expected output, allowed actions, usage/run limits, overlap handling, and completion/expiry rules.

Examples to evaluate, not enabled schedules:

- Morning project briefing: what changed, what is blocked, what needs Alex, and links to the evidence.
- Advance the current milestone: select eligible work within agreed scope, return reviewable results, and stop when exhausted or blocked.
- Quality review: inspect supplied CI failures or newly observed errors; return reproducible findings and candidate fixes.
- Weekly product review: synthesize shipped work and available customer evidence, distinguish observations from hypotheses, and propose the next experiment.

Event-driven follow-up complements schedules: accepted prerequisite work or a relevant CI result may make the next task eligible. Empty checks and repeated unchanged findings should not produce repeated model calls or notification spam.

The queue remains recorded when subscription capacity is exhausted. Work resumes after capacity returns and eligibility is rechecked. A report that could not run is marked delayed; it is not presented as current.

## A target working day

Alex agrees a bounded onboarding milestone and the conditions under which implementation may proceed. The planner proposes tasks and dependencies. Eligible tasks run through Claude Code or Codex in prepared environments while Alex works elsewhere.

Alex closes the laptop. The execution host continues while available. Later, the phone shows a preview and a specific decision: an invitation-expiry behavior is ambiguous. That decision is attached to the affected task; unrelated eligible work can continue.

Alex requests a revision. The new deliverable preserves the earlier version and records the feedback. The next briefing links to the revised output, identifies the checks run against it, and distinguishes review readiness from production deployment.

This is a target scenario, not a claim of implemented autonomous delivery.

## Acceptance, completion, and attention

- A run finishing is different from satisfying a task's acceptance criteria.
- Checks are tied to the exact artifact or commit they inspected.
- Accepting a report or code change does not implicitly authorize a merge or deployment; existing explicit authority can cover those actions without repeated confirmation.
- Reports identify source coverage, time, uncertainty, and the next useful decision. Missing customer/analytics access is visible.
- Notifications link back to durable work. Read, accepted, revision requested, and shipped are different events.
- Manual steering and concurrent device edits preserve revisions and expose conflicts.
- Usage controls protect included subscription capacity. There is no metered fallback, automated credit purchase, or allowance multiplication by spawning agents.

## Scope intentionally deferred

Ambient voice, continuous screen awareness, companion personality/memory, home automation, robotics, and universal computer use are not early product requirements. The [shared-presence proposal](shared-context-and-presence.md) is retained as historical context.

Telegram/WhatsApp are optional access surfaces. Native mobile apps, live session migration, multiple execution hosts, and autonomous production releases need concrete evidence before selection. Product scope is OS-agnostic; environment capabilities still depend on the actual host.

## How usefulness is measured

Evaluate one real milestone and a recurring briefing after implementation is authorized. Observe owner time spent directing/reconstructing work, whether deliverables are actually used, revision burden, accepted results, and whether reports reduce decisions left unresolved. Count shipped/accepted outcomes separately from agent turns and busy time.

Read [stories and acceptance criteria](epics-and-stories.md), [architecture](../architecture/README.md), and [qualification plan](../architecture/review-and-roadmap.md).
