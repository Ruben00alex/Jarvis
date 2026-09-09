# Persistent project state and agent context

Proposed ownership · 2026-09-09. The current goal is continuity of project work, decisions, and deliverables. General personal memory and ambient context are deferred.

## Logical data ownership

These are conceptual records, not migrations to build. Prefer equivalent records in an adopted product.

| Owner | Records | Why they outlive a harness |
| --- | --- | --- |
| Project work | Projects, briefs, milestones, task revisions, dependencies, policy references | Goals and authorization remain after a chat ends |
| Coordination | Routines, occurrences, assignments, claims, capacity waits | Scheduled work and ownership survive process/client interruptions |
| Execution | Attempts, worker/native session references, observations, effect receipts | Failures and retries remain inspectable |
| Deliverables | Artifact references/digests, checks, review decisions, versions | The owner can inspect the exact work that was accepted |
| Context | Sources, revisions, project associations, decision evidence | A later assignment can recover why work was requested |
| Delivery | Inbox items, notification intents, delivery/read receipts | A notification failure does not rerun completed work |

Propose PostgreSQL for a composed custom application because multiple clients and durable coordination now need a common transactional authority. Modules own writes through narrow operations; one physical store does not mean agents or modules may change arbitrary tables. Standalone evaluation uses supplied snapshots/in-memory substitutes or a module-specific test store.

If Paperclip is adopted, its supported data model/API is authoritative for integrated work. Avoid a second writable backlog. External Git issues may be linked/imported initially; bidirectional sync is deferred until ownership and conflict rules are explicit.

## Physical records and artifacts

Code remains in Git repositories/worktrees. Large reports, screenshots, logs, and exports remain in managed artifact storage. Database references include origin, version/digest, owner, visibility, and retention intent. Initial storage may be local; object storage is optional if remote access/backup requirements justify it.

Native harness state stays in the execution environment's provider storage, bound to the correct account. Preserve native references and relevant exported messages/artifacts; do not assume every transient tool event or provider internal state can be exported.

The management record stores owner discussion and decisions independently of native sessions. A full conversational archive across unrelated applications is outside scope. Keep enough execution provenance to audit work without collecting hidden reasoning or secrets.

## Context assembly

An assignment receives a bounded package:

1. Current objective and executable scope revision.
2. Task requirements and acceptance criteria.
3. Relevant decisions and source excerpts with identities, revisions, and timestamps.
4. Repository/base commit, prepared environment, and relevant prior artifacts.
5. Allowed actions, run limits, and output contract.
6. Native session reference if compatible resumption is available.

Ordinary code selects by project/task links, explicit references, and lexical/structured search. A subscribed planning/research run can synthesize broader context when needed. No paid embeddings, API-based summarizer, or perpetual memory agent is required.

Fresh sources must be fetched through authorized tooling before claiming current state. Stored customer notes are not live customer access; an old preview/check is not evidence for a new commit.

## Agent read and write boundary

Execution can begin with a static bundle. When live task/context access is needed, expose scoped operations using the adopted product's tools/API or a small supported MCP/CLI bridge.

Examples of intended operations: read task, search allowed project sources, propose task changes, attach deliverable, record blocker. These are meanings, not frozen tool names. The trusted server stamps run identity, validates project scope and authority, and rejects guessed cross-project IDs.

Agents never receive PostgreSQL credentials. A worker credential should authorize only its assigned operations and should not permit policy changes, account administration, or arbitrary source deletion.

Agent proposals remain distinguishable from accepted decisions. Automatic updates within standing authority are allowed and recorded with actor/source provenance. Inferring a new preference or expanding scope does not turn it into an owner instruction.

## Versioning and lifecycle

- Record revisions for plans, tasks, policies, routines, and deliverables. Admission and review commands use expected revisions.
- Use durable command/occurrence identities to make retries safe. Uniqueness is an application contract implemented with existing database/coordinator facilities.
- Preserve decision history and supersession; mark a stale finding instead of rewriting what was known earlier.
- Removing/correcting a source invalidates affected derived context and briefings. Search must not continue serving a deleted source from a stale index.
- Retention covers artifacts, native session files, run records, and notifications as distinct classes. Deletion in JARVIS cannot promise deletion from Git hosts, model providers, or backups it does not control.
- Store actual quota observations with timestamps and provider identity; unknown values are not zero. Never store secret values as task metadata.

## Backup and restoration

A usable restore includes consistent database state, referenced artifacts, project repositories/configuration as applicable, and enough protected provider-state information to identify what must be reauthenticated. Credentials follow separate secure-storage procedures; do not put raw tokens in routine reports or general artifact backups.

After restore, run reconciliation before enabling dispatch. A recovered task record does not prove an old remote worker is stopped, a session is resumable, or a release was not already published.

Test restoration into an isolated location and inspect missing artifact/session references. Search indexes can be rebuilt from retained sources. Choose actual retention periods and backup tools during implementation qualification rather than claiming high availability from persistence alone.
