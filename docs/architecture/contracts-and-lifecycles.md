# Work contracts and lifecycle semantics

Proposed meanings · 2026-09-09. These are evaluation contracts, not frozen schemas, generated APIs, or a universal agent framework. Reuse the selected coordinator's equivalent mechanisms.

## Small boundary records

| Record | Minimum meaning |
| --- | --- |
| Project scope | Project ID, objective/milestone, approved scope revision, authority policy, relevant source references |
| Task | Stable ID, purpose, acceptance criteria, priority, dependency references, lifecycle state, revision |
| Assignment | Task/scope revisions, chosen provider/account binding, prepared environment, context references, allowed actions, run limits, expected deliverable |
| Run receipt | Stable dispatch/attempt ID, worker and native session references, timestamps, observed state, usage availability, artifacts and effects |
| Routine | Purpose, trigger, explicit timezone, source scope, deliverable contract, policy, limits, overlap/missed-run behavior, active period |
| Deliverable | Task/run references, artifact revision/digest, evidence, limitations, requested decision, review state |
| Review command | Actor, target deliverable revision, requested action, expected record revision, retry identity |

An environment descriptor identifies actual access and restrictions; it is not a self-issued permission grant. A provider session ID is a native reference, not the project's identity or proof that files/session state still exist.

Every boundary can be exercised with supplied records. No module must import another module's private database types.

## Task, run, and release state are different

Proposed task states:

~~~mermaid
stateDiagram-v2
  [*] --> Proposed
  Proposed --> Ready: sufficient scope and authority
  Ready --> Running: dispatch admitted and claimed
  Running --> Review: deliverable available
  Review --> Done: acceptance criteria satisfied
  Review --> Ready: revision requested
  Ready --> Blocked: prerequisite or capacity unavailable
  Running --> Blocked: further progress unavailable
  Blocked --> Ready: cause resolved and eligibility rechecked
  Running --> Cancelled: stop reconciled and task ended
~~~

This is a readable product view, not an exhaustive engine state machine. Cancellation can also end nonrunning work. Reopening a Done task is explicit and creates new work/revision history. A project/routine pause prevents new dispatch; active runs are stopped only if requested and confirmed.

Run states distinguish queued, starting, running, stop requested, succeeded, failed, cancelled, and unknown. A run may succeed and deliver a report explaining why implementation is blocked. A failed run may still produce useful artifacts. Retry is a new attempt, not erasure of failure.

Verification status belongs to evidence for an exact output version. Review acceptance belongs to the owner or explicitly authorized policy. Merge/deployment receipts belong to release actions. None is inferred merely from a zero exit code.

## Eligibility and ownership

Before starting work, the coordinator validates:

- The task and scope revisions are current; the project/routine is active.
- Required dependencies are satisfied at the required stage: verified, accepted, merged, or deployed as specified.
- The task has adequate inputs and action authority.
- The provider is subscription-authenticated; capacity and environment are available.
- No other run owns the task or a declared conflicting resource.
- The assignment fits the permitted time/concurrency limits and expected output.

Use existing transaction/claim primitives in the selected foundation. One admitted claim owns the task until completion or reconciliation. Human edits to scope during execution invalidate continued dispatch under stale scope and trigger a stop/steer/review decision.

Independent worktrees may run concurrently. Work that changes the same shared environment or integrates to the same target branch must serialize or use the existing hosting system's conflict controls. Dependency satisfaction is rechecked after source changes.

## Crash boundaries and duplicate dispatch

Persist an assignment identity before launch. The worker/native integration must return a correlatable receipt. Repeated delivery of the same assignment must look up the existing attempt, not start another blindly.

| Interruption | Required behavior |
| --- | --- |
| Before a claim commits | Another eligibility pass may claim the task |
| After claim, before launch | Inspect assignment/worker evidence before recovering the pending start |
| Launch happened, acknowledgement lost | Reconcile by dispatch/native reference; absence of acknowledgement is not absence of execution |
| Observation lost during work | Mark Unknown; inspect the existing worker/session before retry |
| Artifact exists, result record incomplete | Reconcile output/version and checks; do not assume success or repeat side effects |
| Review command response lost | Retry the same command identity; return the committed decision |
| External publication outcome unknown | Inspect provider receipt/target state before any repeat |

If the selected adapter cannot reconcile a possibly running process, stop automatic redispatch and surface the uncertainty. A timer expiring is insufficient to release potentially active external work. Do not create a custom distributed lease system for the initial single-coordinator deployment; later multi-host failover needs separate qualification.

Durable workflow replay protects recorded steps, not arbitrary subprocess or external side effects. DBOS or another engine must not wrap an entire long CLI invocation in an automatically retried step without a run-reconciliation boundary.

## Routine occurrences

A routine is a durable definition; each firing creates an occurrence with the definition revision and scheduled instant. The identity should prevent duplicate firing of that occurrence across retries.

Recommended policy defaults to evaluate:

- Persist an explicit IANA timezone, initially the owner's America/Tijuana unless overridden. Show next execution locally and store occurrence instants unambiguously.
- Coalesce missed briefings into one current briefing, with coverage disclosed. Do not send a backlog of stale morning reports after downtime.
- Do not overlap occurrences that operate on the same milestone/resource. Coalesce, skip, or queue according to the routine's recorded policy.
- A work-draining routine selects eligible tasks rather than creating duplicate tasks at every tick.
- Record paused, skipped, delayed, failed, and completed occurrences separately.
- Editing a routine affects future occurrences; in-flight work retains its scope revision unless deliberately stopped or redirected.
- Persist notification intent separately from work completion; retry delivery without regenerating the report.

Cron, event triggers, and completion callbacks use the same eligibility path. Notifications/webhooks are hints to reconcile authoritative state, not permission to skip scope checks.

## Subscription limits and recovery

When a provider reports quota exhaustion, retain its reset time when available and mark waiting_capacity. Avoid repeated model calls to discover an unchanged limit. If the reset is unknown, use bounded backoff or owner action and label the uncertainty.

At wake-up, recheck subscription mode, credentials, scope, and dependencies. Expired login is waiting_auth, not quota exhaustion. A paid fallback or automated purchase is never a recovery path.

A provider change creates a new attempt from durable context and artifacts. It does not assume that Claude and Codex can read each other's native session state.

## Review, steering, and devices

A review action targets an immutable deliverable revision. Accepting revision A does not approve a later revision B. Duplicate commands return the existing result; conflicting revisions return current state for resolution.

Accept means the specified acceptance condition is met. Publishing still requires the applicable existing authority. Routine authorized reversible actions do not need a new approval at every command.

Stop acknowledgement precedes observed stop. Preserve partial artifacts and report already performed effects. Unsupported steering becomes an explicit stop/reconcile/new-assignment path. Never delete an environment while its worker may still be active.

Cross-device synchronization reads the same durable record. Offline UI labels stale data; consequential commands require fresh server validation. Every execution/result view exposes the last observation time and source.
