# What JARVIS is for

Product brief for review · 2026-09-07 · No software has been implemented.

**JARVIS should be a persistent conversational presence that shares my permitted context, gets to know my work through experience, and can help me act on it.**

The owner's OS-1 reference exposed a missing premise in the first draft: JARVIS cannot understand “this customer” or “my next call” without actual shared context. Read [Shared context and presence](shared-context-and-presence.md) first. It explains the reference, where awareness comes from, cold-start behavior and the gaps in the current design.

The four modules explain how we might build that. They are not the product's menu, and users should not have to understand them. This document describes the experience; [epics and stories](epics-and-stories.md) define observable outcomes. These are product hypotheses drawn from the owner's brief, not findings from user interviews or a committed release plan.

## Who we are designing for

The owner clarified the center of gravity: **business, software engineering and entrepreneurial work, with breadth across everyday tasks.** Initially, design for a founder/builder moving between customer conversations, product choices, code, research and follow-up. The immediate frustrations are repeated explanation, searching for something already found, and supervising work that ought to be delegable.

JARVIS should be a working partner across those contexts and someone the owner can think aloud with. A customer problem can lead to an investigation, a code change, a draft response and a later follow-up once the relevant identities and sources are grounded. That is the experience to work toward; the whole chain is not a prerequisite for the first useful task.

The initial user is also the owner of the device/accounts. Shared households, enterprise teams and invisible access to other people's information are not assumed. Examples below are illustrative situations, not claims about the owner's personal life or real prices/results.

## Three things worth being good at

| User need | What the user says | Useful result |
| --- | --- | --- |
| Get a bounded job off my plate | “Look into this customer-reported bug while I prepare for the next call.” | Findings tied to actual files and checks, with a next step. |
| Stop making me find the same information | “Where did we write down why we chose this approach?” | The decision and its original context, or an honest gap. |
| Make unfinished work easy to return to | “Pick up the comparison from last week.” | The right work, saved material, unresolved question and a useful next action. |

Natural conversation, shared attention and continuity are central product hypotheses. Voice should be evaluated early as part of that experience, even while individual modules remain independently testable. Phone access and richer monitoring can extend it later. A successful background job alone does not validate the sense of an ongoing companion.

## What using it would feel like

These scenarios describe downstream behavior. Each assumes supplied or connected sources, not automatic knowledge of the user's life. Their grounding conditions are listed below.

| Scenario | Where the context must come from |
| --- | --- |
| Customer bug | Supplied/shared thread or explicit introduction, project and sample. A sender name alone does not establish a customer relationship. |
| Proposal comparison | Attached/shared documents with known source identities. |
| Past decision | An observed/imported conversation or decision record; no record means no supported recollection. |
| Resumed comparison | A saved job/artifact link and episode, with ambiguity resolved if multiple matches exist. |
| Competitor watch | User-specified source, baseline and a functioning observer. |
| Customer-note synthesis | Supplied/authorized notes and known identities where counts depend on them. |

### 1. A small coding problem while I do something else

**Situation:** A customer says the export button fails on a large result set. I have another call shortly and want useful investigation before I get back.

**Me:** “Investigate this export bug using the project and sample data. Try to reproduce it and suggest the smallest fix. Leave my working copy alone.”

JARVIS identifies the supplied project and acknowledges the boundary: inspect a separate copy and return findings. I see a small job entry with its current activity and a Stop action. I carry on using my editor normally.

The useful result is not “I analyzed your repository.” It is something like: “The supplied large fixture reproduces the failure. It reaches this timeout in the export path; the smaller fixture passes. Here is the reproduction and a proposed bounded change.” Those statements appear only if supported by the actual run. If the data does not reproduce the issue, or credentials prevent a check, that remains visible.

**Me:** “Make that change in your copy and add a regression check.”

JARVIS returns a reviewable diff in its copy. Applying, committing or publishing the change follows the authority I actually gave it. The first inspection request did not imply those actions.

**The value:** I receive inspectable work without managing the agent's individual commands or surrendering my desktop. If opening the underlying harness directly is easier and JARVIS adds no useful continuity or oversight, we have not yet created much extra value.

### 2. Two proposals I need to compare

**Situation:** I have two agency proposals for a landing-page project. One looks cheaper, but the deliverables, revision allowance and handover terms are not obviously the same.

**Me:** “Compare these two proposals. Show what's included, what's missing and what I should ask before deciding.”

JARVIS works from the files I supplied. It returns a table with source page references and a short list of questions: for example, whether source-file handover is included or a delivery date is only an estimate. If a total is illegible or a term is missing, it says so instead of guessing.

**Me:** “Draft a short email asking about those gaps.”

I get an editable draft. No email account integration is required to make this useful, and drafting is not sending. If I later ask to send, that is a separate capability with the actual recipient and content made clear.

**The value:** I move from two documents to a decision-ready comparison and a usable draft. This is an initial candidate that needs document extraction/export support; it is not already supplied by merely having a coding harness.

### 3. I remember the discussion, but not where it happened

**Situation:** A week later I want to revisit a decision.

**Me:** “Why did we decide against the second agency?”

If I made a decision, JARVIS finds the relevant discussion and quotes the reason with a source link. If we only compared options, it says: “We noted that source-file handover was unclear, but I don't have a recorded decision.” It does not turn its previous suggestion into my preference.

**Me:** “Remember that source-file handover is a requirement for this project.”

JARVIS confirms the preference and its scope. I can see, correct and remove it. It should not generalize that statement into a lifelong rule about every purchase.

**The value:** answers are about our actual work, with enough evidence to trust or correct them. “I don't have that” is preferable to invented continuity.

### 4. I stop mid-task and come back later

**Situation:** I am interrupted halfway through preparing a comparison.

**Me:** “Leave this for later.”

JARVIS tells me what was saved: source files, current draft and the unanswered questions. If it cannot preserve a live browser form, it says that now. It does not promise that every tab or login will still work next week.

**Me, later:** “Continue the agency comparison.”

JARVIS brings back the draft and says where we stopped. If there are two matching jobs, it shows them rather than guessing. If the data may have changed, it distinguishes the saved comparison from a fresh check.

**The value:** I recover the working state, including the actual agency comparison and its open questions. Success means less reconstruction, even if a login or a fresh check is still necessary.

### 5. A watch that stays quiet until it matters

**Situation:** I am reviewing positioning for my product and want to know if a named competitor changes its published offer this week.

**Me:** “Check this public pricing page each morning until Friday. Tell me if the price or included limits change.”

JARVIS states whether that source can actually be checked, confirms the end date/timezone and the comparison baseline, and records the watch. It stays quiet on unchanged days. It reports a matching change with before/after evidence, the link and check time. A changed page layout alone is not proof that the offer changed.

If access breaks or JARVIS's host has been offline long enough that it could miss the opportunity, I see that the watch is interrupted. It does not silently pretend it has been watching continuously. “Stop watching” ends it.

**The value:** attention saved without daily status spam. This requires durable scheduling and a reliable source, so it is an extension, not a promise of the first four-module exercise.

### 6. Customer notes become a product question I can act on

**Situation:** I have notes from several prospect calls, a few support messages and a list of ideas. I suspect onboarding is the real problem, but I do not want my hunch presented back to me as evidence.

**Me:** “Group the problems in these notes. Separate what people actually said from our interpretation. What should I investigate next?”

JARVIS produces a short brief: recurring issues with links to the originating notes, distinct-customer counts where identities are known, contrary examples, and questions the notes do not answer. It does not call three mentions a market trend or turn an enthusiastic comment into a purchase commitment.

**Me:** “Turn the onboarding issue into a small engineering brief and draft questions for the next call.”

I get a problem statement, a proposed observable success condition and open questions. If I later ask for a code investigation, JARVIS can pass that explicit brief to execution. A drafted customer follow-up stays a draft until sending is authorized.

**The value:** movement between business context and engineering work without losing the evidence or making me become a project administrator. I retain the product judgment; JARVIS reduces the work of gathering, organizing and carrying it forward.

## A believable day with JARVIS

This is a target experience combining stories below, not a first-release promise. “Next call” requires a fresh connected calendar or an explicit introduction; “the customer” requires a known association. Without those, JARVIS asks rather than manufacturing continuity:

| Moment | Request | What should be waiting for me |
| --- | --- | --- |
| Before a prospect call | “Prepare from these notes and our last discussion. What is still unresolved?” | One-page prep with previous commitments, questions and source links. |
| Between calls | “Investigate the export bug with this sample.” | A bounded investigation running without disrupting my editor. |
| After lunch | “Show me what you found.” | Reproduction evidence or an explicit inability to reproduce; reviewable next step. |
| Before finishing | “Draft an update for the customer using only what we verified.” | An editable draft that does not claim an unshipped fix is live. |
| Next morning | “Pick this up. What still needs me?” | The right result, unresolved decision and saved work, without pasting yesterday's context. |

No silent email/calendar access is assumed in this day. Supplied notes and files are enough to test much of its value. Existing account integrations can later remove manual input where worth the cost.

## The small product surface

Imagine a summonable conversational presence, with voice/text and a visible indication of what is currently shared. A small supporting panel lets the owner show a window/document, inspect remembered context, open results and manage active work. Conversation need not begin with a task. These are product sketches, not a chosen UI framework.

Useful visible states are: working, waiting for me, saved for later, finished with result, stopped, or unable to establish the outcome. If JARVIS says “finished,” I should be able to open what it produced. Routine tool chatter can stay inside a detail view.

The essential controls are Stop, Open result, Show what changed, Continue and the ability to inspect/correct remembered information. A stopped job may already have produced effects; the product states those instead of implying an undo.

## Product rules that apply to every story

- Ask for missing information only when it changes the result or authority; carry forward constraints already given.
- Make reversible work within the agreed scope easy. Ask at a meaningful boundary, not before every file read or browser click.
- “Draft,” “change,” “send,” “buy,” and “publish” are different requests. An approval names the actual action and preserves prior explicit authorization.
- Do not promise continuous work when the host is asleep, the source is inaccessible or the required account is unavailable.
- Show the useful output first, followed by what was checked and what remains unresolved.
- Store only what the enabled history/memory settings allow. Make corrections and forgetting understandable; disclose external copies or backup retention that cannot disappear immediately.
- A lost connection is not automatically a failed action. Explain unknown outcomes and avoid repeating an uncertain external action.

## How we would know this is useful

Use real, owner-selected jobs once implementation is authorized. Record the manual baseline and whether the resulting artifact was actually used. A polished demo is not enough.

| Question | Evidence to collect |
| --- | --- |
| Did delegation save effort? | Time spent instructing, supervising and fixing the result versus doing the job normally. |
| Was the output usable? | Owner accepts/uses it, requests a bounded correction, or discards it; note why. |
| Did memory reduce repetition? | A later question is answered with the right evidence without reattaching the same material. |
| Did resumption save reconstruction? | The user continues from the saved work without repeating requirements or finding lost files. |
| Can I trust its status? | Reported completion matches evidence; unknown outcomes and interruptions are visible. |
| Is proactivity welcome? | Relevant notifications versus ignored, repeated or incorrect interruptions. |

Do not assign conversion targets, delivery dates or claims of time saved before observing this usage. Start by discovering whether one of these jobs deserves repeat use.

## Focus and exclusions

The central product hypothesis is **useful shared understanding that persists across interactions**. Bounded delegated work tests the ability to act on it. A repository report remains a sensible engineering exercise, but the early shared-attention experiment in the companion document is needed to test the OS-1-like experience the owner described.

Automatic purchases, unrestricted inbox management, autonomous host administration, whole-house control and a permanent always-listening companion are not initial promises. Home controls can be useful later, but a basic light switch alone does not validate JARVIS's distinctive value.

The [story backlog](epics-and-stories.md) separates first candidates from later extensions. It is a menu for choosing the next useful slice, not a requirement to build every epic or a return to a dependency-heavy roadmap.
