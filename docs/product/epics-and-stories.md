# Product stories and acceptance criteria

Current proposal · 2026-09-09 · Future behavior, not implemented capability.

These stories implement the [current product direction](README.md). They replace the earlier companion-first backlog; that version remains in Git commit 6f3b41c8b0cb7bfcf7a48e6a95785f01a579c561. New IDs use PM to avoid silently redefining historical J stories.

## PM-01 — Turn an objective into manageable work

As a solo developer, I can discuss a SaaS milestone and receive a proposed plan without writing every task myself.

Accept when:

- Tasks state purpose, acceptance criteria, dependencies, and unresolved questions.
- The proposal uses actual project/source context and labels assumptions.
- I can adjust scope and priorities, authorize a bounded milestone/queue, and see what that authorization permits.
- The planner can create/follow up work within standing authority, but cannot grant itself broader rights.
- Speculative discussion remains discussion until the work is made executable.

## PM-02 — Let eligible work proceed

As the owner, I can leave agreed work available for agents without sending a new prompt for every task.

Accept when:

- Ready work is admitted only under current scope, satisfied prerequisites, available resources, and subscription authentication/capacity.
- Conflicting runs cannot own the same task/resource concurrently; independent work can proceed within limits.
- The selected provider/host and observed state are visible.
- A failed or unknown attempt remains recorded; retry does not erase it or duplicate uncertain effects.
- When work is exhausted or blocked, the system waits and explains why rather than inventing more work.

## PM-03 — Receive recurring deliverables

As the owner, I can define a daily briefing or recurring assignment that persists across interruptions.

Accept when:

- Purpose, source scope, schedule/timezone, output, authority, overlap policy, expiry, and limits are inspectable.
- A firing creates one durable occurrence; repeated delivery does not duplicate it.
- Missed briefings coalesce according to policy and disclose the actual coverage.
- The report links to results and sources, separates evidence from interpretation, and identifies decisions needing me.
- An unavailable source or exhausted subscription produces a delayed/incomplete status, not fabricated current findings.
- I can run once, edit, pause, and end the routine. Pausing future work and stopping active work are distinct.

## PM-04 — Review a result without reading the whole transcript

As the owner, I can open a deliverable and understand what changed and what is ready for a decision.

Accept when:

- Code work links to an exact diff/commit, preview where available, and checks against that output.
- Research/reports identify their sources, coverage time, and limitations.
- I can accept, request changes, or defer a specific version; earlier versions and feedback remain accessible.
- Agent completion, verification, acceptance, merge, and deployment are not conflated.
- A stale review cannot approve a replacement artifact; repeated commands are safe to retry.
- Native logs are available for diagnosis but are not the primary result.

## PM-05 — Continue from another device

As the owner, I can close my laptop and inspect or steer the same work from my phone or another computer.

Accept when:

- Authenticated clients load the same project/task/deliverable IDs and discussion history.
- Closing a client does not terminate server-side work; host unavailability is visibly different from client disconnection.
- The interface shows observation age and stale/offline state.
- Concurrent edits use revision checks instead of silently replacing newer decisions.
- Remote preview links lead to the intended environment or clearly report unavailability.
- Product access has no dependency on the user's desktop running Omarchy.

## PM-06 — Use included subscription capacity only

As the owner, I can run every AI role through my Claude Code or Codex subscription without a metered inference dependency.

Accept when:

- Planning, coding, research, review, and reporting use the actual native subscription path.
- Admission detects/rejects incompatible API-key or other metered configurations and prevents automatic extra spending.
- The application exposes which account/provider mode was qualified, without revealing secrets.
- Quota exhaustion retains work in a capacity wait, using observed reset times when available.
- Unknown usage is labelled; multiple sessions/subagents are not treated as separate allowances.
- No paid fallback, API-funded manager, or automatic credit purchase is present.
- Authentication expiry is distinguished from capacity exhaustion.
- Ordinary board/status/scheduling operations remain available without inference.

This is a gating requirement for every live AI story, including evaluation of third-party adapters.

## PM-07 — Preserve project knowledge

As the owner, I can return to a task with its requirements and decisions intact.

Accept when:

- Later assignments receive relevant project/task context and exact source/artifact revisions.
- Decisions link to their authority and evidence; agent guesses are not presented as owner commitments.
- I can correct a project record and see which derived context is stale.
- Sources outside the assigned project scope are not exposed through search or guessed identifiers.
- Native session loss still leaves usable task/context/artifact history; unavailable native restoration is stated.
- Missing customer/analytics access is visible; supplied notes remain useful inputs.

## PM-08 — Stop, redirect, and recover

As the owner, I can change direction without losing track of partial work or creating conflicting attempts.

Accept when:

- Stop requested and stop observed are separate; existing effects and artifacts are retained.
- Unsupported live steering uses an explicit reconciled successor assignment.
- Lost acknowledgement or connectivity produces unknown state before automatic redispatch.
- A project/routine pause prevents future starts.
- Restart/restore reconciles native and external state before continuing.
- A notification retry does not repeat completed agent work.

## PM-09 — Learn from customers and operations

As a solo SaaS builder, I can schedule source-backed feedback synthesis or quality investigation.

Accept when:

- Inputs are supplied notes or genuinely connected sources with coverage and timestamps.
- Findings separate observed customer statements, duplicate mentions, interpretations, and unanswered questions.
- A product review proposes actionable experiments tied to evidence.
- A quality report points to failures/reproductions rather than claiming a broad audit from a narrow check.
- Follow-up tasks stay within existing authority; outreach and releases use their own applicable action scope.

This extends the first milestone workflow when it has real source inputs. It does not imply automatic market validation or revenue.

## PM-10 — Optional messaging check-in

As the owner, I may receive a short notification and open/respond to a decision from a messaging surface.

Accept when:

- Messages reference canonical work and expose minimal private content.
- Callback actions authenticate the actor and revalidate current policy and artifact revision.
- Delayed/repeated callbacks do not repeat mutations.
- Delivery/read state is distinct from acceptance, and the web interface remains the full record.

Telegram is a candidate; WhatsApp is unevaluated. This story is not a prerequisite for browser-based cross-device use.

## Product slice and traceability

| Target | Stories | Technical qualification |
| --- | --- | --- |
| One milestone with unattended eligible work | PM-01, PM-02, PM-06 | Scope/claims, native subscribed adapter, prepared environment |
| Useful result and later return | PM-04, PM-07, PM-08 | Artifact versioning, checks, stop/reconciliation |
| Recurring briefing and remote review | PM-03, PM-05 | Durable occurrence, delivery, authenticated shared state |
| Broader business work | PM-09 | Real source access and evidence quality |
| Optional notification channel | PM-10 | Callback authorization and deduplication |

Use [qualification and roadmap](../architecture/review-and-roadmap.md) to select the smallest informative experiment. All stories describe outcomes to evaluate after implementation authorization.
