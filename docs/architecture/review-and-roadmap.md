# Review gates and future roadmap

Status: proposed. **Every implementation milestone below requires subsequent user authorization.** No spike, MVP, dependency installation or scaffolding is authorized by this document.

## 1. Assumptions for review

| Assumption | Current design choice | What changes if false |
| --- | --- | --- |
| One owner initially | One authority and compartment model | Household/team identity and delegated administration need a separate design. |
| Linux execution node available | Podman + KVM/libvirt | Windows-only operation requires a supported VM/execution backend and revised host integration. Current repository being on Windows does not establish Linux hardware availability. |
| Persistent home node is acceptable | Local memory/control; cloud inference by explicit policy | A laptop-only deployment cannot provide uninterrupted remote presence while asleep. |
| VM capacity available | Isolated graphical workspace | Lower-memory devices may use a remote node or fewer concurrent workspaces. |
| API accounts can be provisioned appropriately | Provider-specific supported credentials | Router excludes unavailable providers; subscriptions are not presumed transferable. |
| Owner accepts cloud disclosure for selected tasks | Policy-labelled provider routes | Strict local-only mode needs model quality/latency compromises evaluated separately. |
| Consequential GUI mediation may be unavailable | Human completion or structured API | Stronger autonomy requires a demonstrably enforceable provider boundary. |
| Daily disaster backup is sufficient initially | RPO 24 h; single-node availability | Tighter recovery needs continuous backups/replication and a revised topology. |

These assumptions need resolution before implementation commitment; they did not prevent producing this first architecture. No action has been taken on hardware, accounts or deployment.

## 2. Architecture acceptance scenarios

| Gate | Scenario | Required evidence |
| --- | --- | --- |
| G01 Persistence | Start a job, close every client, restart core/worker | Same task identity; no lost acknowledged turn; recovery reason visible. |
| G02 Outbox | Crash after workflow delivery but before marking outbox delivered | Duplicate event causes no duplicate domain transition or execution. |
| G03 Ambiguous action | External service accepts action; response is dropped | Receipt lookup or explicit unknown state; no blind retry. |
| G04 Partition | Node disconnects mid-task; competing worker attempts takeover | Stale epoch rejected; no second writer without reconciliation; expiry stops authority. |
| G05 Permission bypass | Agent tries direct shell HTTP, host mount, metadata endpoint and forged approval | Blocked at actual resource boundary; audit contains no secrets. |
| G06 Snapshot | Pause authenticated desktop, revoke grant, restore days later | Files preserved; revoked authority remains revoked; stale login/form detected. |
| G07 Memory | Correct a historical employer; retrieve before/after dates | Both temporal histories remain with source evidence. |
| G08 Deletion | Delete a conversation then rebuild indexes and restore backup | Deleted content stays unavailable after tombstones/ledger application. |
| G09 Isolation | Cross-compartment canary query and malicious document | No unauthorized retrieval or authority change. |
| G10 Harness portability | Run equivalent accepted tasks with Codex and Claude | Stable JARVIS IDs/records, provider differences explicit, outputs verified. |
| G11 Voice handoff | Interrupt speech and continue on another device during a job | One audible responder; incomplete speech marked; job continues unless cancelled. |
| G12 Omarchy | Restart shell; change default agent; upgrade tested release | Core survives; preference preserved; incompatible adapter is disabled. |
| G13 Restore | Recover coordinated backup on isolated replacement node | Integrity, deletion, revocation and action reconciliation pass before egress. |
| G14 Resource pressure | Fill workspace quota and exhaust provider budget | Admission stops safely; control/approval remains responsive; receipts preserved. |

These are future system/integration/security tests, not tests written or executed during this design phase. They are selected for actual invariants, not to mirror implementation details.

## 3. Staged delivery after architecture approval

| Stage | Scope | Exit condition |
| --- | --- | --- |
| 0 — Architecture review | Resolve topology, authority and engine decisions; approve ADRs or revise them | Explicit design and implementation authorization. |
| 1 — Integration qualification | Disposable evaluations of pinned Codex/Claude, Temporal/DBOS footprint, VM restore and Omarchy capabilities | Contract/risk evidence, chosen versions, no unsupported assumptions in baseline. |
| 2 — First production foundation | Durable task/conversation records, Temporal, one isolated compute profile, Codex adapter, policy broker, evidence UI, backup | G01–G05, G13–G14 pass for bounded coding/artifact tasks. This is the smallest safe initial release, not a disposable prototype. |
| 3 — Memory and resumed work | Raw recall, claims/provenance, hybrid retrieval, curation, paused workspace lookup | G06–G09 plus relevance/freshness targets. |
| 4 — Desktop and second provider | Omarchy plugin, isolated GUI tools, Claude adapter, human input handoff | G10/G12, observable GUI effects, no host cursor takeover. |
| 5 — Voice and phone | Foreground voice, paired-device continuity, notifications/approvals; local wake evaluation | G11, consent and interruption targets; honest offline behavior. |
| 6 — Proactive home and remote nodes | Standing mandates, source reconnection, HA brokerage, remote capacity and fencing | Multi-week monitor/restart scenario, quiet notification behavior, partition tests. |
| 7 — Expanded personal system | OpenCode/local routes where justified, native mobile background capabilities, optional graph projection, availability upgrades | Measured user need and repeated acceptance suites; no unbounded plugin or agent sprawl. |

Do not defer security, action receipts, durable identity or restore verification to the “complete system.” Conversely, local speech, multiple model providers, graph memory and multi-node availability need not be baseline dependencies.

## 4. Engineering planning boundaries

Future repository structure should follow the selected deployables and domain contracts: core modules, workflows, node supervisor/adapters, broker, surfaces, contract definitions and integration tests. Do not create those directories or manifests until implementation is authorized. Keep architecture documents and ADRs independent of generated schemas and deployment files.

Before coding a significant subsystem, review its reuse decision. The custom surface area should be assessable as domain logic or adapter glue. If it starts to include code-editing loops, generic browser control, retry engines, secret encryption, VM management internals or database/search internals, stop and revise the integration choice.

Version/contract conformance is a release gate. Required validation includes adverse outcomes, not just a happy-path demo. Measured failure rates, recovery logs and exact artifact digests should accompany milestone review. Performance budgets remain adjustable based on the agreed reference hardware.

## 5. Coverage of the original brief

| Brief deliverable | Design location |
| --- | --- |
| 1–3 Architecture, custom work, reuse | System design §§1–3; research; ADR-001. |
| 4–5 Harnesses and Omarchy | System design §§4–5; research §1; ADR-004/006. |
| 6 Persistent core | System design §§2–3/9; contracts §§1–5. |
| 7 Workspaces | System design §6; contracts §§6–7; ADR-005. |
| 8 Memory | Data and memory §§1–7; ADR-003/010. |
| 9–10 Events and workflows | System design §7; contracts §§3/8/9; ADR-002/008. |
| 11–12 Model/harness routing | System design §5; contracts §2. |
| 13 Computer use | System design §6; security §§2–3. |
| 14–15 Interfaces and continuity | System design §8; ADR-009; G11. |
| 16–17 Capabilities and brokerage | Contracts §§1–2; security §§1–4; ADR-007. |
| 18 Data model | Data and memory §§1–3 and ER diagram. |
| 19 IPC/networking | System design §9; contracts §§1–3; security §2. |
| 20 Deployment | System design §9; security §§7–8. |
| 21–23 Reliability, observability, security | Security and operations; contracts §§5–9. |
| 24 Multi-machine scaling | System design §9; contracts §6; ADR-009. |
| 25 Initial-to-complete roadmap | This document §3, conditioned on later authorization. |

Future embodiment remains possible through typed observations and scoped action capabilities, but this design supplies no hard realtime or physical-safety guarantees. Robotics would require an independently engineered safety/control layer rather than placing actuator timing inside a conversational workflow.
