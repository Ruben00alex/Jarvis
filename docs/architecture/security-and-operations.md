# Standalone safety and failure boundaries

Independent development does not mean pretending missing safety mechanisms exist. Use a bounded, low-impact exercise with real isolation first. The [stack detail](module-internals-and-stack.md) specifies the proposed Linux account boundary, host-side SQLite files and scoped memory helper. Design broader authority when the capability that needs it is introduced.

## What each module must establish

| Module | Boundary to enforce in its standalone exercise | Failure to expose |
| --- | --- | --- |
| Execution | Actual workspace access and supported native permissions; no unapproved host secrets or external mutations | Start failure, provider failure, cancellation uncertainty, incomplete result |
| Environments | Owned resources and explicit imports; inspect actual host/network reach; cleanup only its resources | Provisioning/release failure, unsupported isolation or restoration |
| Recall | Caller-authorized source scope; no cross-scope output; no authority inferred from retrieved text | Missing evidence, stale snapshot, failed ingest/remove |
| Conversation | Store only intended turns; keep credentials outside model input; distinguish accepted from unsaved input | Provider outage, failed persistence, incomplete response |

For the first exercise, use synthetic content and an isolated environment prepared by the developer through existing software. A temporary directory alone is not an isolation boundary. If the required restriction cannot be enforced, narrow the exercise rather than supply a fake permission approval. A negative test must attempt a forbidden operation against the real boundary, not merely assert that a request included a flag.

## Retained invariants

Harness instructions and tool callbacks are not a substitute for OS/resource isolation. Shell access may bypass tool restrictions. Do not mount a personal home or credential directory merely to make an integration convenient. Use supported harness authentication and the least authority adequate to the exercise.

An agent report or zero exit code is not proof that the requested outcome exists. For an initial report, a person can verify the artifact. Introduce automatic checks for specific objectives when needed, using existing tooling.

Cancellation requests are not evidence that all effects stopped. Timeouts are not evidence that an external action failed. Do not retry unknown consequential effects blindly. These semantics can be supported without a workflow engine.

An authenticated browser can possess broad account authority. The first GUI experiment should use synthetic or low-authority accounts. Real high-impact GUI actions require an enforceable boundary or human-controlled completion; a separate VM alone does not limit what an account can do remotely.

## Observability without an observability platform

For standalone evaluation, capture module operation reference, dependency version, supplied scope, start/end or failure, native reference when available, and artifact/evidence locations. Keep secrets and hidden reasoning out of logs. This may initially be a local structured record; do not make an OpenTelemetry deployment a prerequisite.

Each module should have a documented manual inspection path and an explicit cleanup/recovery behavior. If automatic recovery is unsupported, say so. “Can be restarted and reports what is unknown” is a useful intermediate capability; “recovers all work” needs separate evidence.

## Add infrastructure at a concrete boundary

| Need encountered | Design next |
| --- | --- |
| First real persistent personal records | Store-specific backup, deletion and restore behavior |
| First remote caller or second device | Authentication, authorization and secure transport |
| First consequential external write | Exact action authority, receipt and outcome reconciliation |
| First durable timer/approval wait | Existing workflow engine and restart semantics |
| First concurrent writer/shared resource | Ownership/conflict strategy appropriate to that resource |
| First distributed executor | Partition, revocation and duplicate-execution protection |

These are trigger conditions, not a prescribed delivery sequence. None requires building a central broker, distributed lease system or global event bus before a standalone read-only execution can be evaluated.
