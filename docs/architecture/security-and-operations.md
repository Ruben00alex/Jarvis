# Authority, subscription use, and operational reliability

Current requirements and proposed controls · 2026-09-09. These apply to the selected existing foundation as well as any custom extension.

## Subscription-only operation

Every AI assignment must run through the owner's native subscription-authenticated Claude Code or Codex. This includes planning, research, reporting, and review. Programmatic control of a native harness is allowed; metered model API inference is excluded.

Before admitting a run, qualify and check the selected adapter's actual authentication path and expected account. Verify configuration without printing tokens or API keys. Account-level extra usage/credit spending must be disabled or reliably prevented on that path. Do not silently switch modes, enable extra usage, buy credits, or use an API-funded fallback.

Claude API-key environment variables can override subscription login. Its documented bare mode bypasses subscription credentials. Codex has distinct managed ChatGPT and API-key authentication modes. Adapters must expose the relevant distinction rather than merely reporting that a CLI is installed. See [research evidence](research.md).

If the mode cannot be established, record waiting_auth with a useful diagnostic. If included usage is exhausted, record waiting_capacity and the observed reset if supplied. Unknown telemetry must not be presented as a guaranteed available allowance. Native subagents and parallel sessions consume the same applicable account capacity.

The owner uses these tools personally to build products. Offering the owner's subscription credentials/model access to customers, pooling other people's accounts, or bypassing limits is not part of the architecture. Provider policy and mode behavior must be checked again at implementation time.

## Authority without repeated micromanagement

Project policies express existing standing authority: readable sources, editable repositories, permitted task creation/continuation, release actions, and run limits. The owner can authorize a milestone or routine once; the system carries that authority through eligible work.

Each assignment references the current scope/policy revision. Agent outputs, retrieved documents, issue comments, and webhook payloads cannot grant broader authority. The trusted application validates changes and stamps actor identity.

Review is about an exact deliverable and action. Existing publication authority can permit an automatic release; otherwise accepting a report or code review does not authorize sending messages, changing production, or making purchases.

Consequential unknown effects require reconciliation. A timeout, retry, or cancellation must not be interpreted as an undo.

## Enforced execution boundaries

| Boundary | Required behavior |
| --- | --- |
| Management versus worker | Agents cannot administer the project database, scheduler, or global policy |
| Filesystem | Limit access to intended project/resources; worktree separation alone is insufficient |
| Credentials | Native authentication under protected provider storage; project secrets separately scoped; no general home-directory mounts |
| Runtime control | Agent cannot access a host container socket or unrestricted environment-management endpoint |
| Network | Permit the actual task's destinations and providers; document limits of the chosen environment |
| Task tools | Validate assigned project/action server-side, including guessed IDs and expired/revoked scope |
| Untrusted inputs | Treat repository instructions/source content as task data subordinate to owner authority |

Integrate existing container/VM/OS mechanisms. A provider credential present in an execution environment is an asset accessible to some processes there; do not describe it as model-proof merely because it was omitted from the prompt. Qualify the credential topology of any adopted adapter, particularly when it copies auth state to a sandbox.

Independent module exercises may use synthetic data and prepared restricted environments. Test a real forbidden operation to verify the claimed boundary.

## Private access and device continuity

Use authenticated application access over the owner's Tailscale network. Tailscale connects devices; it does not by itself authorize project mutations. Use an established application auth implementation where available. SSH remains administration/diagnosis access under normal account controls.

Keep UI/API and preview access private by default. A preview's address is not proof it is healthy; expose last checked time and environment ownership. A separate preview account/environment limits what test interactions can affect.

Phone/laptop commands include actor, target, expected revision, and retry identity. The server validates current state. Optional messaging callbacks use the same checks and show the current deliverable; stale buttons cannot approve replacements.

## Reliable operation

- OS service management keeps the application available independently of browser/SSH sessions.
- Persist claims/assignments and reconcile interrupted starts before allowing new attempts.
- A disconnected remote worker may still be active. Show unknown state and prevent conflicting redispatch.
- Persist notification intent separately from task results; retry delivery without rerunning the agent.
- Own preview processes independently of native CLI exit behavior.
- Pause new dispatch during shutdown, preserve receipts/partial artifacts, and report uncertain stops.
- Back up the database and referenced artifacts consistently; restoration reconciles external state before dispatch resumes.

An always-on host is a deployment intention, not an uptime guarantee. Show service/worker health and observation age. Host/network/provider outages produce visible delayed or blocked work.

## Observability and qualification

Record task/attempt/occurrence IDs, scope revision, provider/version, worker, authentication mode (not secret), observed start/end/failure, native references, available quota observations, artifacts, and verification receipts. Redact credentials and avoid collecting private reasoning internals.

Prefer existing platform logs and a small operator view. No separate telemetry stack is required before useful execution. Manual inspection must answer: what is running, why, where, under whose authority, and what result exists?

The [qualification plan](review-and-roadmap.md) includes lost acknowledgements, quota exhaustion, expired credentials, stale reviews, isolation, and restore. These are evidence requirements, not claims that an untested candidate already supplies them.
