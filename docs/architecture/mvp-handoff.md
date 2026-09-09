# Minimal VPS handoff

Prepared 2026-09-09 for the first working slice. This is the implementation handoff, not a claim that a VPS, Paperclip, Docker, or provider authentication has already been configured.

## Outcome

Run one bounded SaaS-project task on a rented, always-on VPS while the owner's laptop is closed. The task uses the owner's subscription-authenticated Claude Code **or** Codex, produces a reviewable result, and appears with the same state from a second device. A scheduled briefing then reports actual project state without a new chat prompt.

The owner has selected these starting decisions:

- One rented VPS first; do not buy dedicated hardware for this slice.
- Tailscale for private access across the owner's devices; SSH for administration.
- Docker Compose for deployed services.
- No model API key, API-funded manager, paid fallback, or automatic extra-credit spending.
- Paperclip is the coordinator candidate to evaluate first, rather than a custom task system.

## Minimal topology

~~~text
Owner browser / phone
        │  private Tailscale access
        ▼
Rented VPS
  ├── OS service manager
  ├── Docker Compose
  │     ├── Paperclip candidate and its supported dependencies
  │     └── persistent database volume, if Paperclip requires it
  ├── protected native Claude Code or Codex authentication
  ├── task workspaces / Git worktrees
  └── backup job and restore instructions
        │
        └── Git hosting, CI, and the selected SaaS repository
~~~

Docker packages long-lived services. It does not automatically create a safe per-task execution boundary. Do not mount the Docker socket or unrestricted host credentials into agent-accessible containers. The selected Paperclip adapter and its documented credential topology determine the actual task boundary that must be qualified.

## Build only this slice

1. Provision one VPS and create a non-root administrator account.
2. Join the VPS and owner devices to Tailscale; verify SSH and private browser access from a second device.
3. Install Docker Engine and Compose through the VPS operating system's supported path.
4. Deploy the pinned Paperclip release using its supported Docker/Compose configuration, with durable volumes and a configuration record. Do not add a custom scheduler, DBOS, another coordinator, Telegram, WhatsApp, or a custom UI.
5. Prove the selected native adapter runs under the intended owner subscription. Inspect authentication mode without exposing secrets. Confirm that API-key configuration and paid fallback/extra-usage behavior cannot be selected implicitly.
6. Register one non-production SaaS repository and a bounded task with acceptance criteria.
7. Dispatch one task in its prepared environment. Capture the native run reference, commit/artifact links, checks, and any decision/blocker.
8. From a second device, view the task and its deliverable; request or accept a revision tied to that exact result.
9. Configure one daily project briefing routine. It must link to durable records and report delayed/blocked status honestly when capacity is unavailable.
10. Back up persistent state and perform a restore/reconciliation exercise before claiming the host is recoverable.

## Acceptance evidence

| Capability | Demonstration required |
| --- | --- |
| Private continuity | A phone or second computer reaches the same authenticated workspace over Tailscale. |
| Subscription-only execution | A recorded Claude Code or Codex run shows the intended native subscription path; there is no API key or paid fallback. |
| Durable work | A task, its run record, artifact/check evidence, and review decision survive browser disconnect and coordinator restart. |
| Scheduled deliverable | One routine produces one linked briefing, or visibly records a capacity/auth delay without inventing a report. |
| Review correctness | A revision request or acceptance targets the precise artifact/check revision. |
| Recovery | Restored state is reconciled against an interrupted/native run before any duplicate dispatch. |
| Boundary truthfulness | A documented attempted forbidden access confirms the advertised worker/credential boundary, or the claim is narrowed. |

## Stop conditions and decisions

Stop before normal task dispatch if the chosen Paperclip adapter cannot prove subscription-native authentication, requires a metered API path, copies protected credentials into an unacceptable environment, or has no viable recurring-deliverable/review flow.

For each result, record **Adopt**, **Extend**, **Reject**, or **Unresolved** for Paperclip's subscription path, schedules, task isolation, review flow, recovery behavior, and second-device access. A custom coordinator is only in scope after a concrete failed capability is recorded in an ADR with the alternatives and ongoing maintenance cost.

## Inputs the owner must choose at setup time

- VPS provider, region, server size, and billing account.
- Linux distribution and backup destination.
- First SaaS repository, bounded milestone, and non-production credentials/environment.
- Which provider to qualify first: Claude Code or Codex.
- The allowed task scope and actions for that repository.

The first environment should have no production deployment credentials. Completing a task, accepting a result, or restoring a server must not imply authority to publish, spend money, or change production.

## Handoff checklist

- Pin and record VPS image, Paperclip version, Docker/Compose version, native harness version, and selected authentication mode.
- Keep Compose configuration and non-secret operational notes in version control.
- Keep secrets outside Git and do not print them in logs or reports.
- Record backup coverage, last successful backup, restore steps, and artifact locations.
- Record observed CPU, memory, disk, and subscription-capacity behavior before changing VPS size.
- Leave a short operator note explaining what is running, why, where, under whose authority, and what requires owner action.

The next engineering task after this handoff is **provision and qualify the existing Paperclip deployment**, not to build JARVIS from scratch.
