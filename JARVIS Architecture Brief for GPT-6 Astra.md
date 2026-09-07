You are the principal architect for a real, working JARVIS-like personal agent system.

Your task is not to merely elaborate on the architecture described below. Treat it as a product vision, a set of requirements, architectural intuitions, and constraints.

Reason independently.

Research current software, agent harnesses, AI APIs, operating systems, protocols and open-source projects before making implementation decisions. Challenge weak assumptions. Simplify wherever possible. Prefer integrating mature software over recreating capabilities that already work.

The goal is a modular, scalable, persistent, agentic companion that can live across a user's computers, phone, home, cloud services and eventually additional devices.

It should feel like one continuous intelligence rather than a collection of chatbots, coding agents, scripts or applications.

The result must be realistically buildable with technology available today.

# Fundamental design rule: DO NOT REBUILD SOLVED AGENT INFRASTRUCTURE

This is one of the most important constraints of the project.

Do not build a new Claude Code, Codex, OpenCode, computer-use framework, browser agent framework, shell agent, MCP implementation, coding harness, generic tool loop, terminal harness or similar system unless there is a concrete architectural reason existing software cannot satisfy the requirement.

A huge amount of agent infrastructure already exists.

Examples include, but are not limited to:

- Claude Code
- OpenAI Codex CLI
- OpenCode
- Gemini/Antigravity tooling
- Pi and related agent harnesses
- existing MCP infrastructure
- existing computer-use agents
- existing browser automation systems
- existing coding agents
- existing sandbox/container systems
- existing workflow engines
- existing home automation systems

Research the current ecosystem rather than assuming this list is complete.

The architectural question should usually be:

> How can JARVIS orchestrate this existing capability?

rather than:

> How can JARVIS reimplement this capability?

For example, if JARVIS needs to modify a software repository, a valid implementation may simply be:

```text
JARVIS
   ↓
create/select workspace
   ↓
invoke Codex / Claude Code / OpenCode
   ↓
provide task + context + capabilities
   ↓
monitor execution
   ↓
receive result
   ↓
verify / remember / report
```

JARVIS does not need its own implementation of:

```text
plan
→ inspect repository
→ grep files
→ edit file
→ execute shell
→ observe output
→ retry
→ inspect git diff
→ test
```

if a mature agent harness already implements that loop extremely well.

The same principle applies outside coding.

If existing computer-use infrastructure can provide reliable screenshot → action → observation loops, integrate it.

If an existing browser agent already exposes a useful control interface, use it.

If Home Assistant already abstracts thousands of physical devices, integrate Home Assistant.

If an existing VM/container manager solves workspace lifecycle, use it.

If a durable workflow engine solves crash-resistant long-running processes, integrate it.

The novel engineering effort should concentrate on what actually makes JARVIS different:

- persistence
- identity
- memory
- orchestration
- context assembly
- event-driven behavior
- workspace management
- cross-device continuity
- permission brokerage
- model/harness routing
- proactive behavior
- integration between existing capabilities

Do not spend months recreating solved primitives.

# Harnesses are replaceable execution engines

Treat agentic harnesses as execution providers beneath JARVIS.

Conceptually:

```text
                       JARVIS
                          │
                  Agent/Harness Router
                          │
       ┌──────────────────┼──────────────────┐
       │                  │                  │
   Claude Code          Codex            OpenCode
       │                  │                  │
       └──────────────────┼──────────────────┘
                          │
                      Workspace
```

Potentially other harnesses will be better for other kinds of work.

The exact set should be determined through research.

JARVIS should ideally be able to delegate:

```text
task
context
workspace
permissions
available resources
expected output
verification requirements
```

to an existing harness and observe its lifecycle.

Avoid tightly coupling JARVIS's identity, memory or task model to one particular vendor's harness.

Claude Code may be best for one task.

Codex may be best for another.

An open-source harness may be preferable for local or highly customized operation.

A future harness may outperform all current options.

The architecture should accommodate this without replacing the JARVIS core.

Think of these systems as analogous to process execution backends.

JARVIS is not Claude Code.

JARVIS can employ Claude Code.

JARVIS is not Codex.

JARVIS can employ Codex.

# Leverage Omarchy's existing agent architecture

Research the current version of Omarchy carefully before designing this system.

Do not assume Omarchy is simply Arch + Hyprland.

Its current AI/agent architecture is directly relevant to this project.

Omarchy already treats coding-agent CLIs as first-class operating-system tools and pre-wires several major harnesses.

Understand and evaluate mechanisms such as:

- its default agent concept
- agent launchers
- unattended agent invocation
- agent skills
- existing Claude Code/Codex/OpenCode integration
- agent usage/status UI
- terminal/tmux agent workflows
- crash-to-agent workflows
- Omarchy plugins
- its broader "agentic/malleable computer" philosophy

Where Omarchy already exposes an appropriate capability, build on it rather than recreating another parallel system.

For example, if Omarchy already knows how to install, launch, configure and update agent harnesses, JARVIS should probably integrate with that mechanism rather than maintaining its own unrelated agent installation subsystem.

However, Omarchy is not itself the complete JARVIS architecture.

Determine where JARVIS should integrate with it, extend it, wrap it, or remain independent from it.

# Product concept

JARVIS is not primarily a chat application.

It is a persistent personal agent runtime with:

- continuous identity
- long-term memory
- multimodal perception
- natural realtime voice interaction
- computer use
- tool use
- autonomous and long-running work
- proactive/event-driven behavior
- multiple execution environments
- cross-device continuity
- explicit permissions and trust boundaries

Visible applications are interfaces into this persistent system.

Closing a desktop interface must not terminate JARVIS.

Disconnecting a phone must not terminate JARVIS.

One agent process terminating must not terminate JARVIS.

A frontier-model request failing must not terminate JARVIS.

Conceptually:

```text
                  INTERFACE SURFACES

        Voice   Desktop   Phone   Web   Home
           \       |        |      |     /
            \      |        |      |    /
                  JARVIS CORE
                      |
       ---------------------------------
       |               |               |
     Memory        Orchestration      Events
       |               |               |
       ---------------------------------
                      |
               Execution Layer
                      |
       ----------------------------------
       |            |          |         |
      Host       Workspaces   Cloud     Devices
```

This is conceptual, not an implementation prescription.

# JARVIS versus agents

Maintain a strong distinction between the persistent system and temporary cognition.

A useful principle is:

**Agents are temporary cognition. JARVIS is persistent.**

An Astra reasoning invocation can terminate.

A Claude Code process can terminate.

A Codex session can terminate.

A browser agent can terminate.

A VM can terminate.

JARVIS remains.

Its state belongs in durable architecture outside individual model or harness sessions.

# Omarchy and the operating-system relationship

A major intuition behind this project is that an open Linux environment changes what an agent can become.

The OS should not simply host JARVIS.

The operating system can become part of the agent's body.

JARVIS should potentially perceive and interact with:

- processes
- filesystem
- terminal
- logs
- system services
- networking
- windows/workspaces
- notifications
- applications
- audio
- screen
- connected hardware

Omarchy/Arch/Hyprland may be an unusually useful host environment because of its openness and scriptability.

Determine whether it should actually become the primary host target.

Do not create unnecessary abstractions around capabilities already naturally available to an agent running in this environment.

# Computer use changes the architecture

Modern multimodal computer-use models fundamentally change the integration problem.

Historically:

```text
assistant
    → application API
    → browser API
    → accessibility integration
    → plugin
    → custom automation
```

Increasingly, an agent can simply operate an ordinary graphical environment:

```text
screen
   → perception
   → reasoning
   → mouse / keyboard
   → observe result
   → continue
```

The GUI itself becomes a compatibility interface.

Therefore, do NOT design JARVIS under the assumption that every application requires a custom integration.

A newly installed application should often already be usable because the agent can see and operate it.

At the same time, do not force visual operation where a structured interface is substantially superior.

JARVIS should fluidly combine:

```text
HUMAN INTERFACES

vision
screen
mouse
keyboard
audio

and

MACHINE INTERFACES

shell
filesystem
APIs
MCP
IPC
databases
OS services
structured browser access
```

These are complementary.

Vision provides universality.

Machine-native interfaces provide speed, precision and efficiency.

Existing computer-use harnesses should be leveraged rather than implementing the entire perception/action loop from scratch.

# JARVIS should have its own computers

Delegated work should normally not hijack the user's active desktop.

If the user says:

> Research flights to Tokyo.

their cursor and browser should not suddenly become unusable.

Introduce a first-class concept of **workspaces**.

A workspace is an execution environment controlled by JARVIS.

Potential classes include:

```text
HOST

User's real operating environment.
Used when the task inherently concerns the user's machine.


SHADOW DESKTOP

Persistent graphical environment with browser,
terminal and ordinary applications.

Used for general delegated GUI work.


COMPUTE SANDBOX

Lightweight isolated environment.

Used for coding, processing, builds, scripts and data work.


DISPOSABLE VM

Strongly isolated temporary machine.

Used for suspicious files, unknown software or experimentation.


REMOTE WORKSPACE

Another physical or cloud machine.
```

These categories are illustrative.

Design the actual abstraction.

The central principle is:

**JARVIS lives outside workspaces. JARVIS owns workspaces.**

# Existing harnesses should execute inside workspaces

This relationship should be considered carefully.

A workspace may contain or expose:

```text
Claude Code
Codex
OpenCode
browser agents
terminal agents
computer-use agent
specialized tooling
ordinary applications
```

For example:

```text
User:
"Implement dark mode in this project."

        ↓

JARVIS understands request

        ↓

selects project + memory context

        ↓

creates/resumes coding workspace

        ↓

chooses appropriate existing harness

        ↓

Codex / Claude Code performs coding work

        ↓

JARVIS watches status/results

        ↓

tests or delegates verification

        ↓

stores relevant outcome in memory

        ↓

reports back to user
```

The JARVIS core should not need to know how to edit source files itself merely because the task involves coding.

Its job is orchestration.

# Do not unnecessarily wrap every harness capability

Be careful about abstraction.

A generic abstraction such as:

```text
agent.execute(task)
```

may be useful.

But attempting to normalize every internal capability of Claude Code, Codex and OpenCode into a giant lowest-common-denominator framework may destroy capabilities those tools already provide.

Design integration boundaries that retain the strengths of the underlying harness.

Consider supporting:

- subprocess execution
- headless/non-interactive modes
- persistent sessions where supported
- structured output where supported
- MCP
- hooks
- skills/instructions
- filesystem/workspace boundaries
- logs/event streams
- exit state
- human steering
- cancellation
- resume
- provider-specific extensions

A thin adapter is preferable to rebuilding the harness behind another generic harness.

# Persistent workspaces are operational memory

Not everything should become text memory.

Imagine a delegated task containing:

- fourteen browser tabs
- a half-completed form
- downloaded documents
- terminal state
- working files
- an authenticated browser session

If the user says:

> Leave this for later.

JARVIS should potentially suspend or snapshot the environment.

Days later:

> Continue the insurance thing.

could restore it.

This gives JARVIS two major classes of long-term memory:

```text
COGNITIVE MEMORY

facts
people
relationships
preferences
episodes
conversations
projects
decisions


OPERATIONAL MEMORY

workspaces
files
browser state
git worktrees
application state
artifacts
snapshots
agent-session metadata
```

Design how the two interact.

# Memory architecture

Persistent memory is fundamental.

Do not rely on a giant model context.

The intended strategy is:

```text
large external memory
        +
strong retrieval
        +
small relevant working context
```

All conversations should be durably archived and retrievable.

Raw source material should generally remain available because summarization is lossy.

Memory should be compartmentalized rather than becoming one undifferentiated vector database.

Potential memory domains include:

```text
raw conversations/events
episodic memory
semantic/factual memory
people/entities
relationships
preferences
projects
tasks
procedures
world state
temporal facts
workspace state
agent execution history
```

Determine the actual model.

# Memory curation

The primary conversational/reasoning model should not perform all memory bookkeeping synchronously.

Consider background cognition responsible for:

- classification
- entity extraction
- fact extraction
- preference detection
- episode creation
- summarization
- deduplication
- contradiction detection
- temporal updates
- provenance
- confidence
- importance
- embedding/indexing

Use smaller or local models where they are adequate.

Memory processing should be allowed to occur asynchronously.

Also consider periodic consolidation analogous to biological sleep:

```text
raw events
    ↓
episodes
    ↓
repeated patterns
    ↓
durable knowledge
    ↓
updated beliefs
```

Historical information should not be destroyed merely because something later changes.

For example:

```text
employment:
    Acme Corp
    valid: 2024-2027

employment:
    Example Corp
    valid: 2027-present
```

Every inferred memory should ideally maintain provenance to underlying evidence.

# Retrieval

Do not reduce personal memory retrieval to:

```text
query → vector search → top 10 chunks
```

Different questions require different retrieval paths.

> What's John's number?

Structured retrieval.

> What was that strange restaurant we found in Tokyo?

Fuzzy episodic retrieval.

> Why did we modify this configuration?

Potentially:

```text
conversation
+
project memory
+
git history
+
tool history
+
workspace state
```

Design a recall/router system capable of intelligently combining:

- relational/structured queries
- lexical search
- semantic/vector retrieval
- temporal filtering
- entity relationships
- provenance
- workspace lookup
- reranking

The reasoning model should receive a compact context package rather than the entire history.

# Event-driven JARVIS

JARVIS should not exist only when prompted.

Possible events include:

```text
email.received
calendar.event_soon
filesystem.changed
build.failed
application.crashed
wifi.disconnected
download.completed
package.delivered
door.opened
device.offline
agent.completed
workflow.completed
price.condition_met
```

An event does not imply interrupting the user.

JARVIS should decide whether to:

```text
ignore
record
update world state
investigate
act
delegate to an agent
create a workflow
ask permission
notify the user
```

Events and long-running tasks must survive restarts.

# Long-running agency

JARVIS should support work lasting:

- seconds
- hours
- days
- weeks
- months

Examples:

> Keep watching for tickets below $150.

> Finish this project.

> Tell me if this flight changes.

> Research this topic.

Long-running work should not require an LLM inference or agent subprocess to remain alive continuously.

Separate durable workflow state from individual cognition/execution sessions.

For example:

```text
durable workflow
      ↓
condition becomes true
      ↓
wake JARVIS
      ↓
JARVIS delegates to harness/model/tool
      ↓
result stored
      ↓
workflow sleeps again
```

Choose mature durable execution infrastructure rather than implementing crash recovery and timers from scratch if a suitable project exists.

# Model and harness routing

Do not assume one frontier model should do everything.

Likewise, do not assume one agent harness should do everything.

The system may route across both models and harnesses.

Conceptually:

```text
                         TASK
                           │
                    JARVIS ROUTER
                           │
           ┌───────────────┼────────────────┐
           │               │                │
      conversation      cognition       execution
           │               │                │
       realtime         frontier         harness
        model             model             │
                                      ┌─────┼─────┐
                                    Claude Codex OpenCode
```

Potential model roles include:

- realtime conversational model
- frontier reasoning model
- computer-use model
- memory model
- embedding model
- local perception model

Potential harness roles include:

- coding
- shell/system administration
- research
- browser operation
- generic computer operation
- specialized domain agents

Research the currently available tools rather than freezing this architecture prematurely.

Avoid unnecessary fragmentation.

To the user, all of this remains one JARVIS.

# Interface surfaces

Design the actual interface architecture.

Do not clone ChatGPT unnecessarily.

## Ambient voice

Natural realtime conversation.

Support:

- wake word and/or push-to-talk
- interruption
- low latency
- speech while delegated tasks continue
- starting and redirecting work verbally
- continuity between devices

## Desktop

Potential surfaces:

- global summon overlay
- keyboard command palette
- voice status indicator
- notifications
- approvals
- active jobs
- active agent executions
- active workspaces
- "show me what you're doing"
- live workspace view
- take-control/handoff

The interface should feel closer to an operating-system capability than a messaging application.

Where Omarchy already provides useful UI around agents, reuse or extend it.

## Phone

The phone is another surface/peripheral of the same JARVIS.

Potential capabilities:

- voice
- camera
- GPS
- notifications
- approvals
- task management
- remote workspace viewing
- continuation of conversation

## Home

Use existing home automation infrastructure wherever practical.

Do not rebuild Zigbee/Z-Wave/Matter/device integrations merely to make them "JARVIS-native."

JARVIS should sit above a mature home automation abstraction.

# Sessions belong to JARVIS

A conversation can begin on desktop, continue through a phone and later resume through a room speaker.

Therefore:

```text
conversation state
task state
identity
memory
```

belong to the persistent backend.

Clients attach and detach.

# Resource and credential brokerage

Agent workspaces should not automatically receive unrestricted access to:

- host filesystem
- credentials
- private data
- network
- devices

Design a resource broker.

For example:

```text
workspace.import(file)
workspace.export(file)
```

rather than blindly mounting the user's home directory.

Credentials should preferably be injected through scoped mechanisms without unnecessarily exposing secret values to reasoning models.

Consider:

- filesystem
- OAuth
- browser sessions
- credentials
- network
- microphone
- camera
- location
- home devices
- financial capabilities
- destructive operations

Permissions should be capability-based and context-aware.

Routine, reversible operations should not require constant confirmations.

High-impact operations should receive stronger authorization.

# Trusted and untrusted workspaces

Consider separate trust domains such as:

```text
PERSONAL WORKSPACE

persistent
authenticated
trusted accounts
private resources


GENERAL AGENT WORKSPACE

persistent/semi-persistent
normal delegated work


UNTRUSTED SANDBOX

disposable
minimal credentials
restricted network
strong isolation
```

These categories are illustrative.

Design the appropriate boundaries.

# Reliability and verification

A useful JARVIS cannot merely be intelligent.

The architecture must account for:

- harness failure
- model failure
- tool failure
- hallucinated completion
- failed UI interaction
- crashed workspaces
- network outages
- stale state
- contradictory memories
- duplicate events
- partial workflows
- changed interfaces

Important actions should be verified through observable results.

Starting a process is not equivalent to proving the GUI opened correctly.

A command returning success is not always equivalent to the desired state existing.

Represent distinctions such as:

```text
planned
attempted
reported_success
observed_success
verified_success
```

Leverage the retry/checkpoint/recovery mechanisms of existing software where they exist.

Do not reimplement industrial workflow durability inside JARVIS if a mature workflow engine can provide it.

# Observability

The system should expose enough information to understand:

- what JARVIS believed
- which task it was pursuing
- which model was used
- which harness was used
- which workspace was involved
- which tools executed
- what artifacts changed
- whether the result was verified
- what memory was written

Design:

- structured logs
- traces
- task history
- execution history
- audit records
- debugging tools

Avoid storing unnecessary private reasoning internals when ordinary structured execution traces are sufficient.

# Local versus cloud

Do not assume everything belongs in the cloud.

Strong candidates for local execution include:

- wake word
- OS event collection
- workspace management
- permissions
- personal memory
- credential brokerage
- simple classification
- local device control
- system integration

Frontier cognition may use cloud APIs.

Existing harnesses may support subscriptions, API access, local models or several providers.

Exploit this rather than building a tightly coupled single-provider architecture.

Useful degraded functionality should remain available during cloud outages where practical.

# Extensibility

Adding a new capability should not require changing JARVIS's core cognition.

Examples:

```text
car.*
camera.*
music.*
robot.*
banking.*
printer.*
3d_printer.*
```

Evaluate:

- MCP
- command-line interfaces
- RPC
- skills
- plugins
- typed tool APIs
- capability manifests
- existing harness extension mechanisms

Do not choose MCP simply because it is fashionable.

Likewise, do not create a custom plugin protocol merely because it is architecturally satisfying if existing standards already solve the requirement.

# Future embodiment

Do not implement humanoid robotics now.

Avoid assumptions that prevent future embodiment.

Future observations may originate from:

```text
desktop screen
phone camera
security cameras
vehicle sensors
robot cameras
microphones
```

Future actions may target different actuator systems.

Keep perception → cognition → action sufficiently general.

# Reuse-first research requirement

Before proposing a new service or substantial subsystem, ask:

1. Does a mature existing project already solve this?
2. Does Omarchy already expose this capability?
3. Does Claude Code, Codex, OpenCode or another harness already provide it?
4. Does an existing Linux subsystem already provide it?
5. Does an established protocol solve the integration problem?
6. Can JARVIS orchestrate the existing software instead of absorbing its responsibilities?

For every significant custom subsystem you propose, explain briefly why existing solutions are insufficient.

This is especially important for:

- agent loops
- shell execution
- code editing
- browser automation
- computer use
- MCP support
- sandboxing
- VM management
- event buses
- workflow execution
- secret storage
- home automation
- speech processing
- databases
- vector retrieval
- observability

Do not produce a giant custom microservice architecture where orchestration around ten mature projects would accomplish the goal better.

# Architectural preference: composition over replacement

The ideal JARVIS may end up looking less like a huge monolithic AI program and more like a carefully designed control plane over excellent existing tools.

For example:

```text
                         JARVIS
                            │
               persistent control plane
                            │
       ┌────────────────────┼─────────────────────┐
       │                    │                     │
     Memory             Workflows            Event system
                            │
                     Orchestration
                            │
      ┌─────────────┬───────┼────────┬─────────────┐
      │             │       │        │             │
   Claude Code    Codex  OpenCode  Browser     Computer-use
      │             │       │        │             │
      └─────────────┴───────┼────────┴─────────────┘
                            │
                        Workspaces
                            │
           ┌────────────────┼────────────────┐
           │                │                │
          Host         Shadow Desktop      Sandbox
```

Do not copy this diagram blindly.

Determine what the production architecture should actually be.

# What I want you to produce

Think deeply before proposing the final architecture.

Use current research.

Do not merely repeat this brief.

Produce an opinionated engineering design that could genuinely be implemented.

At minimum define:

1. Overall architecture and boundaries.
2. What JARVIS itself must implement.
3. What should explicitly be delegated to existing software.
4. Which existing agent harnesses should be integrated and why.
5. How Omarchy's native agent support should be leveraged.
6. Persistent JARVIS core.
7. Workspace/execution architecture.
8. Memory storage, curation, consolidation and retrieval.
9. Event architecture.
10. Durable workflows.
11. Model routing.
12. Harness/agent routing.
13. Computer-use architecture.
14. Desktop, voice, phone and home interfaces.
15. Cross-device continuity.
16. Tool/capability architecture.
17. Permissions and credential brokerage.
18. Storage/data model.
19. IPC/networking.
20. Deployment/service management.
21. Reliability/recovery.
22. Observability/auditing.
23. Security boundaries.
24. Scaling from one Omarchy PC to multiple machines/devices.
25. MVP → complete-system roadmap.

For each major component, distinguish:

```text
BUILD

Something genuinely specific to JARVIS
that we need to implement.


INTEGRATE

Existing software JARVIS should orchestrate.


OPTIONAL / REPLACEABLE

An implementation choice that can change
without redesigning the system.
```

This distinction should be visible throughout the architecture.

# Implementation output

This project is intended to become real software.

The design should be concrete enough that it can subsequently produce:

```text
repository structure
services
interfaces
adapter contracts
database schema
message/event schemas
workspace lifecycle
harness lifecycle
permission model
deployment configuration
development environment
tests
milestones
```

Do not begin implementation before establishing the architecture.

But do not produce an abstract enterprise architecture document divorced from actual software either.

# Final principle

You may change any implementation idea in this brief.

You may reject technologies mentioned here.

You may collapse components.

You may add missing components.

You may decide parts of JARVIS should simply be thin wrappers around existing projects.

That is desirable when appropriate.

Preserve the central product:

**One persistent intelligence with memory, senses, agency and continuity, capable of using ordinary computers like a human while also exploiting machine-native interfaces, able to delegate work into its own isolated environments without taking over the user's computer, and naturally available throughout the user's digital environment.**

And preserve this engineering constraint:

**Do not rebuild the agent ecosystem inside JARVIS. Use it. JARVIS should be the persistent intelligence and orchestration layer that turns existing models, harnesses, tools, operating-system capabilities and execution environments into one coherent companion.**