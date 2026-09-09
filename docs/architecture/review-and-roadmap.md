# Qualification and evidence-led roadmap

Design revision · 2026-09-09. The owner selected a VPS-first Docker Compose deployment and requested the minimal-version handoff. See [Minimal VPS handoff](mvp-handoff.md) for the ordered implementation boundary; it does not authorize unrelated platform construction.

## Decide what to adopt before writing a platform

The first decision is whether an existing tool can provide the core experience using the owner's subscriptions. Evaluate Paperclip first because its documented work/routine model overlaps this product. T3 Code and Symphony are comparison references for execution UX and issue-driven coding, not mandatory companions.

Record exact release/commit, license, runtime requirements, host/account assumptions, supported extension boundary, and observed gaps. Documentation and a successful demo are not substitutes for the cases below.

| Qualification | Pass evidence | Consequence of failure |
| --- | --- | --- |
| Subscription-only execution | Native Claude Code/Codex run uses the intended subscription; no API-key/metered fallback or extra spend | Candidate/mode is inadmissible until corrected or replaced |
| Planning and reporting | These roles also run through subscribed harnesses; no hidden manager inference service | Disable/replace the API-dependent path |
| Useful scheduled work | One routine survives a coordinator restart and produces one linked deliverable with coverage time | Assess supported scheduler behavior before custom work |
| Project continuity | Second-device browser sees the same task, context, output, and review result | Identify auth/UI/state gap |
| Duplicate/lost dispatch | Lost launch acknowledgement does not start conflicting duplicate work | Automatic retry stays disabled for that path |
| Review integrity | Acceptance refers to exact output/check revision; stale action is rejected | Treat as product correctness gap |
| Resource boundaries | Real attempted out-of-scope access is denied by the environment/server | Narrow supported scope or use stronger existing isolation |
| Capacity handling | Quota stop becomes a durable wait; no paid fallback; subsequent eligibility is rechecked | Adapter/control gap must be resolved |
| Restore | Recovered records link to usable artifacts and reconcile active/native state | Do not claim recovery readiness |

The qualification report should state Adopt, Extend, Reject, or Unresolved per capability. Prefer configuration or a supported extension for a small gap. A custom foundation needs an ADR naming the gap, alternatives, and maintenance cost. Do not add DBOS beneath a working Paperclip scheduler merely because it is available.

## First useful product slice

Use one owner-selected SaaS repository and one bounded milestone. Provision one rented VPS and Docker Compose deployment. Configure one subscribed provider first; qualify the other independently before promising routing. Have a prepared execution environment and one daily briefing or similarly useful recurring deliverable.

Target sequence:

1. Capture a brief and acceptance criteria; a planning assignment proposes tasks.
2. The owner establishes executable scope and standing authority.
3. An eligible task runs while the client is disconnected.
4. A result arrives with artifact/preview, verification evidence, and any decision needed.
5. A second device opens the same work and requests/accepts a specific revision.
6. The recurring briefing summarizes actual state, linking to accepted work and unresolved blockers.

The slice includes scheduled work and remote review, not merely a one-off CLI wrapper. It need not include automated deployment, a second host, native mobile, general memory, or messaging integration.

Choose a fixture with a known expected result for technical qualification, then a real owner task for usefulness. Avoid granting production credentials simply to make the exercise realistic.

## Independent development/evaluation

| Responsibility | Supplied input or substitute | What it can establish alone |
| --- | --- | --- |
| Project work | Brief, task/dependency records, recorded planner proposal | Scope revisions, cycle rejection, planning edits, authority transitions |
| Coordination | Fake clock, event fixtures, in-memory task store, fake executor | Eligibility, occurrence identity, overlap policy, bounded retry/capacity waits |
| Execution | Prepared environment and assignment | Native subscribed start, observation, stop, result collection, provider limitations |
| Environments | Fixture files and plain command | Resource restriction, ownership, imports/exports, process/preview lifecycle |
| Context/deliverables | Source snapshots, artifact/check receipts | Relevant bundle, provenance, versioned results, stale evidence handling |
| Presentation | Recorded task/run states | Today/board/review usability, stale-state labels, revision conflict behavior |

A fake provider can test orchestration without spending subscription capacity. It cannot validate billing mode, live provider behavior, isolation, or output quality. Adopted products can be evaluated through their public interfaces; independent development does not imply reimplementing them.

## Failure cases for the first real connection

- Disconnect and reconnect a client while an assignment runs.
- Restart the coordinator before launch, after launch with lost acknowledgement, and after output creation.
- Submit the same scheduled occurrence/review command twice.
- Hit a simulated capacity limit; then separately verify actual native limit behavior where practicable.
- Remove/expire credentials and verify a visible auth wait without fallback.
- Change task scope or a dependency during execution.
- Request cancellation; distinguish acknowledgement from observed stop and retain partial results.
- Present an old review button after a new artifact revision exists.
- Lose preview/notification delivery without rerunning completed implementation.
- Restore an isolated backup and inspect artifact links and uncertain run state.

Do not repeatedly consume real quota to test deterministic scheduling cases. Record provider versions/configurations so changes to CLI defaults can be requalified.

## Subsequent increments, selected by evidence

| Observed need | Candidate increment |
| --- | --- |
| Owner spends time rewriting assignments | Improve milestone/task templates and project context |
| Too many reports need reading | Tighten briefing coverage, deduplication, and decision-focused inbox |
| One provider's capacity blocks useful work | Qualify the second subscribed provider and explicit handoff policy |
| Work is correct but hard to inspect | Improve preview/check links and use existing review tools |
| Browser access misses timely decisions | Evaluate Telegram, then other channels if needed |
| Host resources become the bottleneck | Add a remote worker with partition/revocation/reconciliation qualification |
| Product work needs release automation | Integrate existing CI/deployment with explicit action scope and receipts |

No fixed delivery dates, revenue claims, agent-count targets, or compulsory infrastructure sequence are imposed.

## Measure the owner's result

Track supervision/reconstruction time, accepted or shipped outcomes, revision burden, decision backlog, and report usefulness. Distinguish code shipped from work merely produced. Track capacity consumed where observable, with uncertainty shown.

The user should be able to return after an absence and decide what to do next from the results. If the system creates more task administration than it removes, simplify the workflow before adding autonomy.

## Open implementation inputs

Actual execution machine/OS, intended Claude plan, installed provider versions, native authentication, subscription extra-usage settings, first repository/milestone, and required integrations have not been inspected. These are implementation qualification inputs, not reasons to stop the current documentation work.
