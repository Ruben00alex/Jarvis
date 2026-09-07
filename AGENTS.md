# JARVIS project instructions

Read [JARVIS Architecture Brief for GPT-6 Astra.md](JARVIS%20Architecture%20Brief%20for%20GPT-6%20Astra.md) in full. It is the authoritative product brief, subject to the user's current instructions. Preserve it as the original vision and constraints.

## Current phase

Architecture and system design only. Research, inspect, and create architecture documentation. Do not scaffold applications, write production code, install dependencies, or start an MVP until the user authorizes implementation. A roadmap is not implementation authorization.

## Durable engineering constraints

- Build a persistent personal agent runtime whose identity, conversations, tasks, memory, and permissions outlive clients, models, harnesses, and workspaces.
- Compose mature agent harnesses, workflow engines, OS facilities, databases, browser/computer-use systems, and home automation. Do not recreate their execution loops or infrastructure without a documented concrete gap.
- Treat harnesses as replaceable execution providers. Preserve provider capabilities through thin adapters rather than a giant normalized tool framework.
- Delegated work normally runs in its own execution environment, without occupying the user's desktop. JARVIS lives outside those environments.
- Enforce resource and credential boundaries outside model prompts. Make authority, provenance, uncertainty, and verification explicit.
- Research current primary sources. Distinguish documented capabilities, design judgments, and untested assumptions. Challenge implementation intuitions while preserving the product.
- Prefer a small number of deployable components with clear module boundaries. Explain BUILD, INTEGRATE, and OPTIONAL/REPLACEABLE choices.
- Keep consequential decisions and alternatives in architectural decision records; keep this file concise.

## Design entry point

[Architecture review package](docs/architecture/README.md). Its initial decisions are proposed for review, not approved implementation requirements. Update the architecture and ADRs when decisions change rather than expanding this file into the architecture.
