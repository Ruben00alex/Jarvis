# Architecture

## Decisions

| Area | Starting choice | Reason / remaining choice |
| --- | --- | --- |
| Host | One rented VPS | Low initial commitment; provider, region, size, and Linux distribution are open. |
| Deployment | Docker Compose | Reproducible service configuration with persistent volumes. |
| Access | Tailscale and SSH | Private browser access across devices and remote administration. No Omarchy dependency. |
| Management | Paperclip first | Use its existing tasks, schedules, UI, and records; actual adapter/workflow fit is untested. |
| AI | Subscription-authenticated Claude Code or Codex | Every AI role uses included subscription capacity; qualify one provider first. |
| Persistence | Paperclip's supported database and artifact storage | PostgreSQL is expected from earlier research; confirm the selected release's deployment requirements. |

## Deployment shape

```text
Laptop / phone browser
          |
   private Tailscale network
          |
One rented VPS
  |-- Paperclip management service and web UI
  |-- supported persistent database / artifact storage
  |-- prepared project execution environments
  |     `-- native Claude Code or Codex
  `-- service startup, logs, and backup procedures
```

This is a responsibility map, not a confirmed Compose file. Confirm the selected Paperclip release's supported topology before deciding whether its adapter launches the harness in a service container, a separate worker, or another supported environment. Native login persistence and workspace mounts must work in that topology.

The management service and agents can initially share a VPS, with separate access boundaries. Keep the component count small. No second scheduler, vector database, message bus, or custom frontend is required by this design. PostgreSQL was investigated as persistence; follow Paperclip's supported deployment rather than designing a parallel JARVIS schema.

## Ownership

The browser connects to the management service on the VPS. The service schedules assignments and keeps durable project records. A native harness executes each assignment in a prepared project environment and returns artifacts and checks for review.

Paperclip should own the backlog, schedule, and run history. Git owns code history. Persistent storage holds database state and referenced artifacts. Avoid a duplicate task database or scheduler.

Docker service packaging and agent isolation are separate choices. Git worktrees keep changes apart but do not restrict access. The chosen execution environment must protect management data and credentials; agent processes must not receive database administration credentials or unrestricted Docker socket access. Confirm how the selected adapter stores and exposes native login credentials.

Use existing harness loops and supported adapters. Custom code needs a demonstrated gap before it becomes part of this setup.

## How work progresses

A project holds the objective and context. A task describes a requested outcome, acceptance criteria, and permitted scope. A run is one attempt by a native harness; retries and revisions may create several runs for the same task. A deliverable is the resulting artifact or report, accompanied by checks and a review decision.

The intended visible flow is Proposed → Ready → Running → Review → Done, with explicit blocked and cancelled outcomes. Map this to the existing platform's terminology. Ready means eligible under the agreed scope; it should not imply unrestricted access or automatic deployment.

Scheduling and bookkeeping use ordinary software. Planning, research, review, and report writing invoke the subscribed harness just as implementation does. The native harness owns its own tool loop and subagents; JARVIS should not reproduce that loop or normalize away useful provider capabilities.

Before dispatch, check that the task is still authorized, prerequisites are satisfied, capacity is available, and another run is not already doing conflicting work. Start with conservative concurrency. Independent worktrees can separate changes, while integration into a shared branch needs conflict handling.

An assignment needs the objective, task criteria, relevant project decisions, repository/base revision, allowed actions, and expected output. Preserve this project context outside native chat sessions so a later run can continue even if a session cannot be resumed. A provider change can use an explicit context handoff; it does not transfer a live session between vendors.

## Subscription authentication is a deployment requirement

Alex explicitly requires all AI work to use his Claude and ChatGPT Pro subscriptions. A separate API-funded planning or reporting model would violate that choice. A programmatic native interface is acceptable if it actually preserves the intended subscription authentication.

Earlier research identified native ChatGPT login for Codex and subscription use through supported Claude Code modes as candidate paths. It also identified credential precedence and execution flags as things to inspect. Verify current provider documentation and the actual adapter configuration; a successful CLI launch or zero cost on a dashboard is not evidence of the billing path.

Record the provider/version and authentication mode without recording secrets. Keep paid extra usage disabled or reliably prevented. Expired authentication and exhausted capacity are distinct waits. Preserve work, show the reason, and retry only when appropriate; unknown quota telemetry must remain unknown. Parallel sessions share account limits.

## Recurring work and reports

Use the selected foundation's scheduling mechanisms. A routine needs a project scope, expected output, schedule/timezone, allowed actions, overlap handling, and a way to pause it. America/Tijuana is the owner's current timezone; the daily send time is still open.

The first briefing should answer what changed since its last coverage, what is blocked, and what Alex should decide next, with links to the evidence. Coalesce missed briefings into one current report after downtime. Do not launch overlapping work on the same task or repeatedly regenerate unchanged reports. A failed report should leave the ordinary board and status usable.

Later, a work-advancement routine can pick eligible tasks from an agreed milestone. It should stop when work is exhausted or blocked, rather than creating arbitrary tasks to stay busy. Planning can propose new scope for review.

## Review, interruption, and recovery

Review attaches to an exact artifact or commit, with checks against that revision. A confident agent summary is not a test result. Accepting work does not itself authorize publication; deployment follows whatever authority the owner has separately established.

When execution becomes uncertain, inspect the native process/session, repository, and existing outputs before retrying. Losing a launch acknowledgement does not mean launch failed. If the adapter cannot reconcile the run, leave it visibly unresolved and avoid automatic duplicate work. Stopping a run preserves partial results and distinguishes a stop request from an observed exit.

Persist project records independently of disposable worker environments. Backups need both database state and referenced artifacts; repositories may also contain unpushed work. Document which native state can be restored and which credentials require login again. Restoring a server does not reverse changes made to external systems.

## Essential behavior

- Tasks include scope and acceptance criteria. Agents can advance authorized work without a new prompt for every command.
- All AI roles use the intended subscription login. Check adapter mode and inherited credential configuration; pause for expired login or exhausted capacity rather than switching billing paths.
- Preserve tasks, decisions, results, and partial work across client disconnects and process restarts.
- A result links to the exact commit/artifact and checks. Agent completion, owner acceptance, and deployment are separate outcomes.
- Reconcile an interrupted or unknown run before retrying; it may still be executing or have already changed something.
- Routines specify output, timezone, and overlap behavior. Start with one daily briefing, coalesce missed reports, and show delays honestly.
- Keep application access authenticated and private. Back up database state and referenced artifacts together, and test restoration before depending on recovery.
- Bound concurrency and measure actual CPU, memory, disk, and subscription use before increasing workload.

## Implementation references

These links were collected during earlier design research. Recheck the chosen release and authentication path during setup; no integration has been verified.

- [Paperclip repository](https://github.com/paperclipai/paperclip), [adapters](https://github.com/paperclipai/paperclip/blob/master/docs/adapters/overview.md), [deployment modes](https://github.com/paperclipai/paperclip/blob/master/doc/DEPLOYMENT-MODES.md).
- [Codex authentication](https://learn.chatgpt.com/docs/auth).
- [Claude subscription notice](https://support.claude.com/en/articles/15036540-use-the-claude-agent-sdk-with-your-claude-plan), [API-key precedence](https://support.claude.com/en/articles/12304248-manage-api-key-environment-variables-in-claude-code).
- [SSH over Tailscale](https://tailscale.com/docs/reference/ssh-over-tailscale), [Tailscale Serve](https://tailscale.com/docs/features/tailscale-serve).
