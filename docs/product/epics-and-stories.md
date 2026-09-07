# User epics and stories

Draft for owner review · 2026-09-07. These are future product behaviors, not implemented features, validated demand or committed delivery dates.

Read [What JARVIS is for](README.md) for everyday scenarios and common product rules. Story acceptance criteria describe what a user can observe. Module mapping appears at the end so the product backlog does not become a list of infrastructure tasks.

Owner emphasis: business, SWE and entrepreneurial work across a broad working day. The examples prioritize customer context, product decisions, code and follow-through while retaining general-purpose boundaries.

Labels: **First candidate** = plausible bounded starting value; **Follow-up** = extends proven usage; **Extension** = needs capability beyond the initial exercise. Labels are choices, not a mandatory sequence. All stories retain the relevant stop, authority, evidence and failure behavior from the product rules.

**Revision after the owner's OS-1 clarification:** first-candidate labels below identify standalone task opportunities, not the product priority. Shared presence/grounding must be evaluated early. Voice story J-501 is an early product-experiment candidate rather than merely a late convenience. Every downstream story must identify its current/historical source and uncertainty behavior; connected mail, calendar and host observation are not already implemented.

## E0 — Establish shared attention and familiarity

**Outcome:** I can talk naturally about something we are actually sharing, and JARVIS knows the limits of what it has seen. This is the product foundation missing from the first backlog. See [Shared context and presence](shared-context-and-presence.md).

### J-001 — Let JARVIS see what I am referring to

**Early product candidate.** As the owner, I want to share a document/window and talk about it so I do not have to paste all of its context into every request.

**Accept when:** the shared item and capture state are visible; “this” resolves to that item only when supported; changing/ending sharing updates the current context. If capture or content access fails, JARVIS states that instead of guessing.

### J-002 — Introduce a person or project once and correct misunderstandings

**Early product candidate.** As the owner, I want to establish who or what we are discussing so later references can use that shared history.

**Accept when:** an explicit introduction links to its actual source/object under enabled memory settings; later matching references use it; ambiguous names prompt a small clarification. Correcting one reference does not merge unrelated identities or rewrite unrelated history.

### J-003 — Distinguish remembering something from checking it now

**Early product candidate.** As the owner, I want JARVIS to tell me whether it has current information so I can trust answers such as “did he reply?”

**Accept when:** a current answer comes from a fresh authorized source; a stored snapshot is identified as historical; unavailable access leads to a clear limitation or request for the missing source. Knowing a thread exists is not evidence of its latest reply.

### J-004 — Think aloud without accidentally starting work

**Early product candidate.** As the owner, I want an ongoing conversation about what I am doing so I can explore an idea without issuing a task every time I speak.

**Accept when:** JARVIS can discuss the shared topic and preserve it across a pause; frustration/speculation does not authorize edits or outreach; a genuine request can transition into bounded work without making me repeat the established context. Relevant prior authorization still carries forward.

**Outside this epic:** ungranted full-device observation, perfect reference resolution or claiming personal knowledge without a source.

## E1 — Hand off a piece of work and get something usable back

**Outcome:** I can continue my day while JARVIS produces a result I can inspect. Success is a used artifact or supported finding, not a completed agent run.

### J-101 — Inspect a project without disturbing my work

**First candidate.** As a project owner, I want JARVIS to investigate a specific problem in a supplied project so I can understand the next step without running every investigation myself.

**Example:** “Investigate the customer-reported export failure using this sample. Return a report; don't change my working copy.”

**Accept when:**

- The selected project, requested result and write boundary are visible before work starts; the user's active files and desktop remain usable.
- I can see that work is running and stop it. Failure or lost observation produces a visible reason, not a fabricated report.
- The result links to the inspected files and checks, distinguishing reproduced findings from hypotheses and checks that could not run.

**Outside this story:** fixing, merging, deploying, remote continuation and automatically remembering everything about the project.

### J-102 — Compare supplied documents and give me a draft

**First candidate, alternative to J-101.** As someone comparing two options, I want the important differences and missing information extracted from supplied documents so I can decide what to ask next.

**Example:** “Compare these agency proposals and draft questions about scope and handover gaps.”

**Accept when:**

- The comparison identifies each input and cites its page/section for material claims; unreadable or absent terms stay marked unknown.
- I receive a readable comparison and an editable question draft, rather than only a description of work performed.
- Nothing is sent, signed or ordered; a failed file extraction identifies which input prevented a complete comparison.

**Outside this story:** finding vendors, negotiating prices, mailbox access or professional advice about which contract to sign.

### J-103 — Request a bounded change and review the difference

**Follow-up.** As a project owner, I want a small requested change returned for review so I can choose whether to incorporate it.

**Example:** “Apply the proposed export fix in your copy and check it against the failing sample.”

**Accept when:**

- I can inspect the exact changed files/diff and the checks performed against that output.
- My original work is preserved, and committing/publishing occurs only when that action was authorized.
- If the requested check fails, JARVIS presents the failure and partial work instead of calling the change verified.

**Outside this story:** open-ended “finish my project,” autonomous merging or production deployment.

### J-104 — Research a bounded business or technical question

**Follow-up once source access is available.** As a founder/builder, I want a small, evidence-backed research brief so I can narrow a decision without collecting every page myself.

**Example:** “Compare how three relevant products handle bulk exports. Separate documented features from anything we would need to test.”

**Accept when:**

- The scope and comparison criteria are clear; the result cites accessible sources and check dates rather than inventing a complete market survey.
- Verified descriptions, vendor claims and JARVIS's inference are distinguishable; unavailable or contradictory information remains visible.
- I get a concise comparison, open questions and a recommended next investigation with reasons. No signup, paid subscription or outreach happens implicitly.

**Outside this story:** exhaustive market validation, access to private competitor data, or assuming that a published claim proves a product works as described.

## E2 — Find and correct the things we already know

**Outcome:** I stop re-explaining and hunting for old material. Answers stay grounded in records I allowed JARVIS to use.

### J-201 — Find a previous decision with its context

**First candidate using an imported corpus.** As the owner, I want to ask about a previous discussion so I can recover the reason and source without remembering where I saved it.

**Example:** “Why did we reject the second agency?”

**Accept when:**

- The answer links to the relevant source; ambiguous matches are presented for selection rather than silently resolved.
- A discussion or assistant suggestion is not presented as a decision I made unless the record supports it.
- If the source is missing or outside the allowed scope, JARVIS states that it cannot support an answer and does not leak the excluded content.

**Outside this story:** automatic import of every account or guaranteed fuzzy recall across my entire life.

### J-202 — Explicitly remember something for later

**Follow-up.** As the owner, I want to save a preference or project fact with a clear scope so I do not have to repeat it.

**Example:** “Source-file handover is a requirement for this landing-page project.”

**Accept when:**

- JARVIS confirms the statement and the scope actually saved, and I can inspect its source.
- A later relevant question can use the saved information without applying it to unrelated projects.
- If saving fails, JARVIS says it was not saved. An agent's own inference remains distinguishable from my explicit instruction.

**Outside this story:** automatic personality inference or asking me to approve every harmless archival record.

### J-203 — Correct or forget a memory

**Required when persistent personal memory is enabled.** As the owner, I want to inspect, correct or remove remembered information so incorrect or unwanted context stops influencing later answers.

**Example:** “That requirement applied only to the landing page. Remove it from my general preferences.”

**Accept when:**

- I can see what will be corrected/removed and whether the source conversation is also affected; these are not silently treated as the same request.
- New responses respect the correction/removal, including after restart and search-index rebuild.
- If a source is also being deleted, stale derived copies are excluded while deletion completes; external copies and backup retention limits are explained accurately.

**Outside this story:** promising immediate deletion from third-party systems JARVIS does not control.

## E3 — Return to unfinished work without starting over

**Outcome:** a break in attention does not mean losing the requirements, artifacts and next step.

### J-301 — Continue a conversation after closing the interface

**First candidate.** As the owner, I want to reopen a previous conversation so I can continue without pasting its history back in.

**Example:** “Back to the agency comparison—make the questions shorter.”

**Accept when:**

- Previously accepted turns remain available after closing/reopening; unsaved or interrupted output is identified.
- The correct conversation can be selected, and prior applicable constraints are carried forward.
- If inference is unavailable, saved history remains inspectable; JARVIS does not invent a new response or claim access to an unavailable artifact.

**Outside this story:** phone handoff, full-project recall or restoring a running agent process.

### J-302 — Save a job for later and resume from its output

**Follow-up.** As someone interrupted mid-task, I want the current files and remaining question preserved so I can continue later with less reconstruction.

**Example:** “Save this comparison; I'll come back tomorrow.”

**Accept when:**

- JARVIS confirms the actual saved artifacts and remaining work; if it cannot stop safely, the state stays explicit.
- Returning opens the right saved work and identifies what still needs doing; ambiguous job names prompt a small selection.
- Expired access or changed external information is surfaced before relying on it. Files-only recovery is not described as restoration of all browser tabs/forms.

**Outside this story:** universal snapshots, migration of a live model session or continuous execution while the only host is asleep.

### J-303 — Change direction or stop work already in progress

**Required for running delegated work; advanced steering can follow.** As the owner, I want to stop or narrow a job so it does not continue against an outdated request.

**Example:** “Stop the comparison. Just keep the extracted totals.”

**Accept when:**

- I can issue Stop without navigating through agent internals; acknowledgement and observed stop are distinguished.
- JARVIS preserves requested available output and reports any effects that already occurred; it does not imply cancellation undid them.
- If live steering is unsupported, it stops/reconciles and offers a successor request rather than pretending the current agent received the change.

**Outside this story:** guaranteed rollback of external actions.

## E4 — Watch a specific thing without constantly interrupting me

**Extension. Outcome:** I can stop checking an agreed source, while understanding the watch's coverage and limits. This epic requires durable monitoring that is not yet part of the first exercise.

### J-401 — Set a bounded watch

As the owner, I want to specify a source, condition and end date so JARVIS watches something useful rather than monitoring indefinitely.

**Example:** “Check this competitor's public pricing page each morning until Friday; tell me if price or included limits change.”

**Accept when:**

- Source, check cadence/timezone, condition, end date and permitted action are visible; unsupported access is rejected before a watch is called active.
- The watch is still recorded after a restart without needing a model to remain running.
- Last successful check and interrupted coverage are inspectable; downtime is never counted as a successful unchanged check.

### J-402 — Notify me about a meaningful change

As the owner, I want one useful notification when the condition changes so I do not have to read repeated status updates.

**Accept when:**

- A matching observation includes the source, baseline and check time; page-layout changes are not reported as confirmed price/limit changes without evidence.
- Repeated observations of the same unchanged condition do not repeatedly notify me; any re-alert rule is explicit.
- Quiet hours/urgency preferences are respected, and sustained inability to check becomes a visible interruption rather than silence implying health.

### J-403 — Inspect, change or end a watch

As the owner, I want to see and stop active watches so forgotten monitoring does not keep spending resources or interrupting me.

**Accept when:**

- I can inspect the condition, latest result and expiry and change or stop the watch.
- Stopping prevents new checks; an in-flight check is labelled and does not quietly restart the watch.
- A watch never implies purchase authority. Any purchase capability requires its own concrete request and validation.

**Outside this epic:** searching all websites, guaranteed uninterrupted availability, automated purchasing or minute-by-minute monitoring without an agreed need.

## E5 — Reach the same work through another surface

**Outcome:** voice and shared conversation are part of the core product experience; phone and remote handoff extend it. They preserve the same work and boundaries. J-501 should be evaluated early for presence, while J-502/J-503 remain later capability extensions.

### J-501 — Speak a request and interrupt the reply

As the owner, I want to speak a request and stop spoken output so interaction fits moments when typing is inconvenient.

**Accept when:**

- I can see when capture is active and correct a misunderstood request before it causes a consequential action.
- Interrupting speech stops playback promptly; “stop talking” does not silently cancel an unrelated background job.
- Text/result access remains available if the voice connection fails, and interrupted output is not treated as fully delivered.

### J-502 — Check existing work from my phone

As the owner away from the desktop, I want to inspect an existing job's result so I can decide what to do next without starting a new conversation from scratch.

**Accept when:**

- After authentication, the phone shows the same job/result and appropriate conversation context.
- Offline or stale status is labelled; a sleeping/unreachable home machine is not presented as a live executor.
- Notifications do not expose private document contents on a lock screen by default.

### J-503 — Take over when a browser task needs me

As the owner, I want to take control of a delegated browser task so I can finish a login or review a form without fighting the agent for input.

**Accept when:**

- JARVIS explains the specific point needing me and shows the relevant environment.
- Agent input is stopped before human control is granted; if that cannot be verified, handoff does not proceed as though it were safe.
- On return, JARVIS checks the new state and continues only within the current request; stale queued clicks are not replayed blindly.

**Outside this epic:** reliable background mobile audio before native/platform support, every application being automatable, or automatic authority to submit a form because I completed login.

## E6 — Turn business context into useful next actions

**Outcome:** I spend less time turning scattered notes into meeting preparation, product questions and follow-up drafts. JARVIS preserves the distinction between customer evidence, our interpretation and a decision I actually made.

### J-601 — Synthesize customer feedback without manufacturing certainty

**First candidate with supplied material.** As a founder, I want patterns and contradictions pulled from customer notes so I can choose what to investigate rather than rereading everything.

**Example:** “Group the onboarding problems in these notes and suggest questions for the next calls.”

**Accept when:**

- Each material finding points to the relevant notes; explicit statements, inferred themes and unanswered questions are distinguished.
- Counts distinguish known customers from mentions; duplicated notes do not inflate the apparent demand. Unknown identity or sample bias is disclosed.
- The output includes a usable short brief and proposed questions, without presenting a small supplied sample as validated market demand.

**Outside this story:** automated customer interviews, a guaranteed product strategy or deciding the roadmap for me.

### J-602 — Prepare for a meeting from the context I already have

**First candidate with supplied notes; Recall integration is a follow-up.** As a founder, I want a compact meeting brief so I arrive knowing the open questions and previous commitments.

**Example:** “Prepare me for the Acme call from these notes. What did we promise, and what should I ask?” Acme here is illustrative.

**Accept when:**

- The brief identifies the intended meeting/customer and separates recorded commitments from suggestions or tentative dates.
- Important points link to the supplied or authorized sources; missing recent context is stated rather than invented.
- Preparation neither contacts anyone nor changes a calendar. If live account access is unavailable, I can still supply notes and get a useful brief.

**Outside this story:** constant inbox surveillance, automatic calendar access or representing me on the call.

### J-603 — Draft the next business artifact from verified work

**Follow-up.** As a founder/builder, I want an editable engineering brief or customer update from the work we just did so I can move to the next step without rewriting the context.

**Example:** “Turn this issue into a small engineering brief, then draft a customer update with what we know.”

**Accept when:**

- The requested artifact includes the relevant problem, evidence and unresolved questions; proposed scope and success criteria remain labelled as proposals.
- Customer-facing text does not describe an investigated bug as fixed, a tested change as deployed, or a suggested delivery date as a commitment.
- I can edit the draft. Sending, creating an external issue or publishing it occurs only if that specific action is authorized; an unavailable integration does not prevent receiving the draft.

**Outside this story:** autonomous delivery promises, quoting terms on my behalf or automatically populating an entire project management system.

## Product-to-module map

This is traceability, not an additional set of epics or a required build sequence.

| Stories | Relevant modules | Capability gap to keep visible |
| --- | --- | --- |
| J-001–004 | Conversation + supplied context; Recall and permitted host observation when connected | Current attention, source identity, reference resolution and freshness; no magical background knowledge |
| J-101, J-103 | Execution; supplied environment or Environments | User-facing result presentation; supported checks |
| J-102 | Execution; supplied environment or Environments | Document extraction and useful editable output |
| J-104 | Execution with existing research/browser tools | Reliable source access and evidence capture |
| J-201–203 | Recall; supplied corpus or Conversation export | Inspect/correct/forget user flow and source propagation |
| J-301 | Conversation | Reopen/select interaction surface |
| J-302–303 | Execution + Environments; optional Conversation/Recall context | Artifact resumption, safe stop/steer; no universal snapshot guarantee |
| J-401–403 | Future durable orchestration calling existing boundaries | Scheduler/source adapter, persistent watches and notification delivery |
| J-501–503 | Conversation/Execution/Environments as applicable | Voice/mobile/viewer integration and authenticated handoff |
| J-601–603 | Conversation or Execution with supplied material; Recall optional | Source-grounded synthesis and useful artifact output; no live account prerequisite |

## How to choose what to build

Choose an early shared-attention conversation (J-001–004, with J-501 for voice) to test the experience the owner described. Separately, J-101 remains a useful Execution qualification exercise. J-601/J-602 test downstream business value when their source context is present. A passing coding exercise does not establish that JARVIS understands “my next call.”

After that job is useful, try a later return to the same work. Observe what the owner has to repeat and where the product loses context. Let that evidence select the next story. Do not implement all stories in epic order, and do not treat these acceptance criteria as authorization to begin coding.
