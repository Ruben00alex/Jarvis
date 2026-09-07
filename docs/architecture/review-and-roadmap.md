# Where to begin and how to evaluate modules

This replaces the previous end-to-end roadmap. All work described here is future work; implementation remains unauthorized. The [module stack detail](module-internals-and-stack.md) now supplies concrete technology defaults for these independent exercises.

## Recommended next exercise: execution alone

**Question:** can a caller reliably hand a bounded task to one existing harness, observe it, stop it, and inspect its output?

Supply a small synthetic repository, a prepared isolated location, supported harness credentials and the request: “Inspect this repository and produce a report describing its structure and one issue supported by file evidence.” Use a known seeded issue so the report can be assessed. Inputs are explicit; no task planner or recall system selects them.

The smallest useful exercise needs only the native harness integration, lifecycle observation and report retrieval. A developer can call it directly; no product UI is necessary.

| Case | What must be observable |
| --- | --- |
| Normal completion | Progress and actual report; distinguish finished from verified |
| Invalid location or unavailable provider | Clear failure, no invented result |
| Cancellation of a sufficiently long run | Request acknowledged separately from observed stop |
| Lost observation or interrupted process | Unknown/partial state, no false completion |
| Attempted forbidden access | Rejection at the actual isolation/permission boundary |

A human first checks the report against the fixture. This establishes the contract; it does not claim general coding quality, long-running recovery or production reliability. If the native interface already provides the necessary behavior, keep JARVIS's adapter correspondingly small.

**Stop and review after this exercise.** Use the result to decide whether execution needs improvement, environment setup should be automated, or another module is more valuable. Do not automatically proceed through a predetermined stack.

## Other modules can be evaluated separately

| Module | Standalone input | Evaluation | Absent JARVIS dependencies |
| --- | --- | --- | --- |
| Environments | Fixture files and isolation request | Prepare, inspect access, release; restart only if advertised | Harness, model, recall, conversation |
| Recall | Synthetic records with known answers and scopes | Retrieve evidence, handle ambiguity, remove a source, reject cross-scope recall | Live conversation, execution, scheduling |
| Conversation | Text turns and explicit identity instructions | Reopen history, continue, expose persistence/provider failure | Recall, tools, environments |

These are choices, not numbered delivery stages. Provider substitutes can exercise local behavior; a real provider/backend test is separately necessary before claiming integration support. Do not install dependencies or build these fixtures during the architecture phase.

## Review a module with five questions

1. Can it run without another unfinished JARVIS module?
2. Is the input/output small enough for a manual caller to understand?
3. Does the exercise expose failure and authority limits as well as success?
4. Are we writing product-specific glue or duplicating existing infrastructure?
5. What evidence now requires another capability or architectural decision?

Only then choose the next connection. A larger roadmap can emerge from working modules and user priorities; it should not be a dependency graph imposed on the first task.

## Checks for the proposed stack and memory connection

Run these only when their corresponding module/connection is built:

- Each module can run with only its own temporary SQLite file; no other database or package process must be running.
- A real workspace cannot read any host JARVIS database or control the container runtime.
- Recall rejects guessed source IDs outside the token scope, expired scopes and a proposal citing inaccessible evidence.
- A successful `memory.propose` creates a pending, source-backed record; it does not silently create a confirmed fact.
- A repeated proposal/import with the same key does not duplicate it; a lost acknowledgement is recoverable by retry.
- Conversation continues when Recall is down; pending source changes survive restart, and deleted data is not served from a stale Recall copy.
- A SQLite backup restores accepted data and selected artifact references; live WAL files are not ignored during backup.
