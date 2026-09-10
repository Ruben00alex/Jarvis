# Minimal setup handoff

## Current implementation status

The owner narrowed the immediate milestone to a VPS with Docker running
Paperclip. That infrastructure is now deployed; see [Operations](operations.md)
for the actual host, versions, access, and demonstrated checks. The owner account
has claimed the instance and the Jarvis organization dashboard works. Initial
private access is through an SSH tunnel. Tailscale is installed and enabled at
boot; owner sign-in and private HTTPS setup are pending.

The broader workflow below is retained as later context. Its historical
"nothing provisioned" descriptions and agent/briefing acceptance criteria do
not describe the current milestone.

## Goal and current state

Get one SaaS task running through Paperclip on a VPS, review its result from a second device, and receive a scheduled project briefing.

The owner wants to continue the minimal version. The VPS, Docker Compose deployment,
owner account, and initial private dashboard access are provisioned and documented.
Start with the remaining follow-ups in the [operations note](operations.md):
Tailscale enrollment, provider integration, assignments, briefings, and recovery
testing.

## Context for the next person or agent

Alex is a solo SWE trying to build and operate SaaS products. Coordinating multiple chat sessions, prompting every assignment, and switching devices have become cumbersome. He wants a persistent project workspace that helps plan and delegate work, keeps it progressing within agreed scope, and returns deliverables and reports for review.

The project began as a much broader JARVIS companion architecture. That is historical context, not an implementation backlog. The Ben Davis inspiration that survived was always-on remote execution using Tailscale and SSH. Alex later found Paperclip and said it was almost exactly what he wanted. Treat Paperclip as the preferred starting foundation and inspect its actual fit, rather than restarting a broad platform comparison.

Alex chose renting a VPS because it has a small recurring cost and avoids an up-front hardware commitment. Docker Compose is the agreed packaging direction. No provider, region, plan, Linux distribution, or monthly bill has been selected. The learning/refresher material from another conversation was explicitly excluded from product scope.

Every AI role must use the owner's subscription-authenticated Claude Code or Codex. This includes the planner and report writer. If included usage is unavailable, work waits. This requirement must survive convenience choices made during installation.

## Repository and work status

The repository is at `G:\Astra\Jarvis`, with origin `https://github.com/Ruben00alex/Jarvis.git`. The product context is in [README](README.md), with technical choices in [architecture](architecture.md). The original brief and Ben Davis transcript remain at the repository root as reference material.

Commit `44c727b` contains the earlier detailed architecture and MVP handoff. The current three-document consolidation replaces that package; inspect Git status before editing or committing because documentation edits may still be uncommitted. The transcript was user-supplied and untracked at the last check. Preserve unrelated working changes.

No application has been scaffolded, no dependencies installed for this plan, no VPS provisioned, and no live Paperclip/subscription integration verified in this work. Existing research links are starting points, not deployment evidence. Do not report a check as passed until it has actually been exercised.

The owner has said he wants to start a minimal version. The immediate request here is to repair the documentation and handoff. The old architecture-only restriction was withdrawn. For implementation, proceed with useful repository inspection and configuration preparation; obtain the actual host/account inputs when they become necessary. A host preference does not supply credentials or select a billable rental.

## Inputs needed

Choose a VPS provider/region/size, Linux distribution, backup destination, first repository and bounded task, and either Claude Code or Codex to connect first. The owner supplies account access and completes subscription login as needed. No specific rental price or capacity estimate has been verified.

Do not ask Alex to redesign the whole system. Inspect the current environment and prepare a concrete deployment recommendation first. Account access, a rental selection, and the first real repository/milestone are the inputs that cannot be inferred. Exact runtime versions and straightforward configuration choices can follow supported upstream defaults and be recorded.

## First implementation session

Read the current Paperclip deployment and adapter documentation, inspect the relevant configuration/source, and choose a pinned release to try. Answer three specific questions: how to deploy it through Compose, how the chosen adapter uses the owner's subscription login, and where project data and agent workspaces persist.

Prepare the smallest supported deployment configuration, a non-secret environment example, and reproducible setup instructions in this repository. If an upstream Compose configuration is available, start there. If it requires adaptation, document the actual reason. Do not silently assume Docker implies that the harness already runs in an isolated worker.

Check current VPS pricing and resource requirements before recommending a particular plan. The earlier roughly $10/month discussion is budget context only. Service minimums do not establish capacity for builds, browsers, or concurrent agents. Start conservatively and measure the real workload.

If account/host access is missing, finish those reviewable preparations and state exactly what input is needed next. Once access is available, work through the following sequence and record evidence as it is obtained.

## Setup sequence

1. Check the current Paperclip release, supported deployment method, and selected native adapter. Record versions. Confirm a viable subscription login path before committing to the integration.
2. Provision the chosen VPS, configure SSH and Tailscale, and verify access from the owner's devices.
3. Deploy through Docker Compose using the supported upstream configuration or a minimal adaptation. Keep configuration in Git, secrets outside Git, and data in persistent storage. Ensure services return after reboot.
4. Connect one subscribed harness. Verify the actual authentication mode and that paid fallback/extra usage is disabled or reliably prevented.
5. Prepare one project environment with limited credentials and conservative concurrency. Confirm its restrictions; start without production deployment credentials.
6. Assign one bounded task. Collect the change/report, exact commit or artifact, test evidence, and blockers. Review it from another device while the original client is disconnected.
7. Configure one daily briefing using the existing scheduler. Record its timezone, sources, expected output, and missed-run behavior. Include changes, blockers, decisions, and result links.
8. Back up persistent records and artifacts, restore into an isolated location, and reconcile interrupted work before enabling dispatch.

## The first assignment and briefing

Use one real, bounded task in the owner's selected SaaS repository. It should have a clear expected result and checks that can be run in the prepared environment. A small bug fix or feature is suitable; the repository and task have not been chosen. A supplied test repository can prove the technical connection while those inputs are pending, but it does not establish business usefulness.

The assignment should include the goal, acceptance criteria, base revision, permitted changes, relevant project context, and expected output. Ask for a concise result containing the commit/diff or report, checks performed, limitations, and any decision needed. Keep production credentials out of this initial exercise.

For the briefing, use actual task/run records and available repository evidence. Its output should identify the coverage period, changes since the prior briefing, blocked work and reasons, decisions for Alex, and links to the relevant results. Choose the daily time with the owner, record America/Tijuana unless changed, and test both a manual occurrence and a scheduled one. Reports must also use the subscribed harness.

## Done when

- Work continues after the laptop disconnects, and a second device shows the same task and result.
- A real run uses the intended subscription; an auth/quota failure leaves visible pending work without paid fallback.
- The result is reviewable with checks against its exact version.
- A routine produces a useful briefing without a new prompt.
- Restart preserves records and does not blindly duplicate an uncertain run.
- Backup restoration recovers the records and their artifacts.

Exercise the checks proportionately: disconnect the original client during real work, inspect the result from another device, restart services, simulate an auth/capacity failure where practical, and test backup restoration. Do not deliberately spend an entire subscription allowance to test exhaustion. Clearly distinguish simulated behavior from observed provider behavior.

## Handling gaps without expanding the project

If an adapter cannot satisfy subscription-only execution, pause that integration and record the exact mode, version, and failed requirement. Investigate supported configuration or another native adapter path. Do not replace it with metered inference.

If review or routine behavior is awkward, first try existing platform features and simple workflow conventions. A custom view or extension needs an observed inconvenience that matters to this owner. A replacement coordinator needs a concrete unsupported requirement and an explanation of why integration cannot address it. DBOS, another scheduler, and a new frontend are not starting dependencies.

If isolation or recovery is incomplete, describe the actual limitation and narrow the trial accordingly. A supervised demonstration can be useful evidence while remaining insufficient for unattended operation. Keep that distinction visible in the status report.

## What to leave behind after implementation

Finish setup by adding a short operational note here: deployed versions, private service address, storage and backup locations, start/stop/update commands, demonstrated checks, and remaining limitations. Never include secret values.

Also include the first task and briefing references, the selected provider's verified authentication mode, where to inspect logs, and how to pause scheduled dispatch. Record host sizing observations so the next person can distinguish a resource problem from a provider quota wait. Separate completed setup from pending owner input and untested assumptions.

The handoff is successful when someone can identify what is running, reproduce its configuration, review a real result, and continue from the recorded state without reconstructing this conversation.
