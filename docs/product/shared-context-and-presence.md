# Historical proposal: shared context and presence

Historical owner clarification · 2026-09-07 · Deferred by the 2026-09-09 scope revision.

**This is not the current product foundation or implementation priority.** It is retained to preserve the earlier companion vision. The [current product brief](README.md), [architecture](../architecture/README.md), and ADR-016 in [decisions](../architecture/decisions.md) supersede its scope and early voice/shared-attention experiment. Its grounding principles remain useful for project context; its four-module/API-era placement is historical.

The owner referenced OS-1 from *Her* (2013) and challenged how JARVIS could understand phrases such as “this customer” and “next call.” The earlier product stories skipped the source of that understanding. Treat those stories as conditional outcomes until their context requirements are explicit.

## The experience we are aiming for

**JARVIS is a persistent conversational presence that can share my attention, learn the context of my life and work, and act from that context.** Business and SWE are important parts of that life; they are not the full definition of the product.

In the screenplay, Samantha's familiarity has concrete inputs: interaction with Theodore, access to his files/mail/contacts, and later a device camera. She asks to inspect his drive before discussing its contents. My product interpretation is that access and shared experience are central to the feeling of familiarity. The film compresses the work of understanding those inputs; we must explicitly design and evaluate it. [Spike Jonze's screenplay](https://assets.scriptslug.com/live/pdf/scripts/her-2013.pdf)

For JARVIS, the desired properties are a consistent voice and conversational manner, continuity across interruptions, awareness of permitted current context, memory of what we experienced together, and appropriately timed initiative. It should also support thinking aloud or conversation without turning every remark into a task. Voice and shared attention are central product hypotheses, not just polish for a jobs dashboard.

## How it can actually know what I mean

The model does not acquire knowledge of my computer or schedule merely by being capable. Every referent needs an input. Keep four kinds of input distinguishable:

| Input | What it provides | Limit |
| --- | --- | --- |
| Current conversation | The person, document or choice just discussed | A topic may have changed; pronouns can remain ambiguous. |
| Shared attention | Selected text, active document/tab, a permitted screen view or camera view | Only the captured/structured content is known; being the active app does not prove user intent. |
| Connected sources | Authorized calendar, mail, contacts, files or project records | A connected account is not complete knowledge; access, sync coverage and freshness matter. |
| Remembered episodes and links | The work we did before, source identities, artifacts and explicit associations | Only observed/imported interactions exist here; summaries can omit things. |

Model inference links those inputs to an utterance. It must not invent the missing input. Resolve identity separately from role: reading a sender name does not establish that the person is a customer. An introduction or an authorized record must support that association.

| User phrase | Minimum grounding | What JARVIS does without it |
| --- | --- | --- |
| “This customer” | An explicitly shared thread/contact, recent introduction or clearly active discussion | “Do you mean Alex in the thread you're showing me?” If no candidate exists, ask which customer. |
| “My next call” | A fresh allowed calendar view, or a time/call the user explicitly mentioned | “I don't have your calendar connected. Which call?” It must not pretend to know the schedule. |
| “This approach” | A selected passage, visible proposal or specific alternative in the current conversation | Name the plausible alternative or ask which one; don't attach the phrase to an arbitrary old decision. |
| “The comparison from last week” | A stored episode and linked artifact in the relevant date range | Retrieve candidates. If there are two, name both briefly. If none, say it has no record. |

For a reversible discussion with one well-supported candidate, proceed while making the referent natural: “For the export approach we just discussed…” For sending or changing something consequential, resolve the concrete target against current evidence. A remembered association can help find a target, but does not authorize an action.

## How shared understanding grows from day one

This is a fictional interaction illustrating the target behavior, not a claim that the software currently does it.

**Day one, before source access:**

Me: “Can you look at this?”

JARVIS, if no screen/content is shared: “I can't see what you're looking at yet. Share the window or the text.”

I share a support thread: “Alex is a customer of Atlas. This is the export issue.”

JARVIS: “Okay—Alex, the Atlas export issue. Are you trying to understand the failure or work out how to answer?”

The relevant thread/contact identifiers, source and project association can be retained under enabled memory settings. Routine authorized context recording should not require me to manually curate every sentence into a fact. Ambiguous identity links and agent-generated conclusions remain distinguishable from explicit introductions.

**Later in the same conversation:**

Me: “How would you explain this to him?”

JARVIS can resolve “this” to the active issue and “him” to Alex because we established them. It drafts from the known facts; it need not ask me to identify him again merely because the wording is abbreviated.

**The next day:**

Me: “Did he reply?”

With mail access, JARVIS can retrieve the remembered thread and check fresh messages. Without it: “I remember Alex's export thread, but I can't check new replies from the copy you shared.” Remembering and observing current state are different capabilities.

**If I mean somebody else:**

Me: “No, I mean the other Alex.”

JARVIS corrects the current reference. It does not merge two contacts permanently just to avoid asking a question. This correction becomes useful context when supported, not an excuse to rewrite unrelated history.

The familiarity is earned through access, introductions, observations and corrections. The goal is progressively less repeated setup, rather than a promise that first use feels like years of shared history.

## Presence includes talking, silence and initiative

“I'm stuck on this” may be an invitation to discuss the idea, not permission to edit a repository. JARVIS should be able to ask a relevant question, help develop an argument, or listen without launching a workflow. Personality means a consistent manner shaped by explicit preferences and shared interactions; it does not require a new execution engine.

Useful initiative has a visible basis. With an enabled source and relevant notification preference, “Alex replied to the issue we were looking at” can be helpful. It must come from a newly observed reply and a remembered association. If the source has not been checked, the sentence is unsupported. If I am presenting or have muted interruptions, the result can wait unless the agreed urgency calls for interruption.

There is no need to stream every screen frame or room conversation into a permanent archive. Begin with deliberate sharing and optional scoped observation. Show whether screen, microphone, camera and account access are active. A persistent relationship does not require every sensor to be recording continuously.

## Minimum technical consequence within the four modules

This identifies missing responsibilities; it does not authorize a new platform or fifth module.

| Module | Responsibility needed for grounded presence |
| --- | --- |
| Conversation | Assemble a small current-context record: recent dialogue, active topic, explicitly shared target, observation time, source scope and unresolved references. Resolve or clarify references before using them. |
| Recall | Preserve episodes and source/object links, including user-established associations. Retrieve candidates with provenance; distinguish history from fresh external state. Optional source readers make available only the content actually connected. |
| Environments | Eventually expose an explicit, read-only user-desktop observation adapter. Keep it separate from observation of the agent's own workspace: those are two different desktops. Existing OS/browser interfaces provide capture. |
| Execution | Receive an already-grounded request with concrete source/resource references; return artifacts and observations that can become shared history. A prompt alone is insufficient when its resource reference is unresolved. |

For example, a current-context record could mean “user shared mail thread T at this time; introduced sender C as customer of project P; current topic is export failure.” It is ordinary bounded application state, not an enormous permanent world model or a frozen schema. Long-lived evidence belongs in Recall; “the current window” expires or changes when attention changes.

A text-only Conversation module with optional manually supplied context is still independently useful, but it does **not** yet deliver OS-1-like shared attention. The current stack document provides persistence and tool access; it has not established host perception, mail/calendar connections or conversational reference-resolution quality. Those gaps must be made explicit before any feature claims rely on them.

## Product experiment that should come early

The code-analysis exercise remains useful for qualifying Execution. It does not prove the product experience the owner is describing.

An early **product** experiment should instead establish whether JARVIS can follow one shared activity. Use two synthetic documents with similar names, a deliberate sharing surface and a short conversation; use voice when testing presence, and label a text-only exercise as testing grounding only. No inbox or continuous sensor capture is necessary.

The owner introduces one document and its project, asks “what do you think of this?”, switches to the other, corrects an ambiguous reference, then returns after reopening. Observe whether JARVIS follows the correct object, asks only the necessary question and preserves the association it actually learned. A prerecorded context stream tests a module; real desktop sharing tests the actual connection. Do not confuse the two.

Success criteria:

- Referents point to the right source, or uncertainty is made explicit; the system never invents observation access.
- Changing the shared item changes current context without erasing historical context.
- A correction is used in subsequent turns without contaminating unrelated people/projects.
- Reopening preserves the established history but does not claim that yesterday's screen is still current.
- Conversation can remain conversation; no tool action is launched merely because the user expresses frustration or explores an idea.

This is a candidate to review, not a replacement fixed roadmap. It tests the foundation of the desired experience before writing more stories that assume it works.
