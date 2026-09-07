# Data ownership and memory

The four-module ownership model remains unchanged. At the user's request, [Module internals and stack](module-internals-and-stack.md) now proposes SQLite per module, FTS5 for initial recall, and scoped agent memory operations. Its sections 6–9 specify database paths and complete read/write flows. No universal schema or vector service is required.

## Each module owns what it needs

| Owner | Records it needs | What others receive |
| --- | --- | --- |
| Execution | Request, native reference, observed outcome, artifact locations | Result/progress records |
| Environments | Owned resources, access descriptor, observed status | Descriptor and lifecycle responses |
| Conversation | Canonical turns, ordering, explicit identity instructions | Exported turns and recent context |
| Recall | Ingested sources or indexed copies, source revisions, derived retrieval state | Evidence-backed matches |

These responsibilities now map to four separate local SQLite files, each opened only by its owning module. This adds no database daemon or cross-module startup dependency. Modules use `better-sqlite3` and module-owned migrations; no shared SQL or cross-database joins. The files remain outside agent workspaces. Local fixtures establish boundary behavior; live restart and backup evaluation establishes the actual durability claim.

## Recall can start with documents

The first recall exercise uses a small synthetic corpus with known sources and answers. It need not extract a knowledge graph, infer preferences or perform nightly consolidation.

Start by assessing whether supplied questions return useful evidence using SQLite FTS5 and ordinary scoped relational queries. Add semantic retrieval if fuzzy questions demonstrate a gap; grow structured claim handling when actual questions require it. Evaluate candidate packages rather than assuming all curation must be custom. [Research candidates](research.md)

The following meanings matter regardless of implementation:

- A source has an identity, revision and visibility scope.
- A retrieved answer points to the supporting source/excerpt; uncertainty remains visible.
- Removing a source removes it from subsequent results and affected derived content.
- A correction preserves enough evidence to distinguish historical truth from a current assertion when the caller asks a historical question.
- An assistant's unsupported statement does not become confirmed personal knowledge merely because it was archived.

Source-backed excerpts are a valid first result. Claims, entities, confidence fields, embeddings and temporal tables are possible later representations, not an entry schema.

## Connect conversation without sharing internals

Conversation remains the source of truth for its turns. Recall ingests exported copies carrying source IDs and revisions. Re-importing an unchanged revision should not duplicate it. A changed or deleted source must update the retrieval view.

The stack document defines revisioned imports, retryable receipts and deletion handling for the optional live connection. These are built only with that connection. Until then, a static exported corpus is explicitly a snapshot, not live memory. Conversation must still work when Recall is unavailable.

Artifacts follow the same principle. An execution report can be supplied to Recall as a source without giving Recall authority over the workspace. A task-to-workspace association can later support resumption; it does not require modelling all operational memory first.

## Agent access

Agents read through scoped `memory.search` and `memory.read` tools. They write proposed notes/facts through `memory.propose`; Recall validates and stores them with provenance. They cannot open SQLite, execute SQL, overwrite confirmed facts, change identity or delete sources. First promotion can be performed by a trusted human caller. This makes writing memory functional without assuming automatic curation already exists. See the stack document's sequence diagram and authorization details.

## Decisions deliberately open

The default store and initial index are now proposed; extraction model, semantic-search backend, graph representation, retention duration and cross-device replication remain open. Before storing real personal data, choose retention/encryption and test the documented SQLite backup/restore approach. We retain these obligations without implementing an entire storage platform as the first module.
