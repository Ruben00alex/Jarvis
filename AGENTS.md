# JARVIS project instructions

Read [JARVIS Architecture Brief for GPT-6 Astra.md](JARVIS%20Architecture%20Brief%20for%20GPT-6%20Astra.md) in full. Preserve it unchanged as the original vision. The user's current direction and [current product brief](docs/product/README.md) supersede its broader scope and implementation intuitions.

## Current phase and scope

Architecture and system design only. The user authorized architecture revisions on 2026-09-09, not implementation. Do not scaffold applications, write production code, install dependencies, configure services/accounts, or start an MVP without implementation authorization. A roadmap is not that authorization.

Design a personal workspace that helps a solo SWE build and operate SaaS products: project plans, agent assignments, recurring deliverables, reviews, and persistent access across devices. Tailscale, SSH, and an always-on execution host are desired foundations. Omarchy is optional; no OS-specific desktop dependency.

All AI work, including planning, research, reviews, and reporting, must run through the user's subscription-authenticated Claude Code or Codex. No metered model API calls, separate API-funded manager, paid fallback, or automatic extra-credit spending. Verify the actual adapter/authentication path; pause when included usage is unavailable.

## Durable engineering constraints

- Project state, decisions, work history, permissions, and deliverables outlive clients, models, harnesses, and workspaces.
- Compose existing harnesses, scheduling/workflow infrastructure, databases, OS facilities, and environment systems. Document a concrete gap before rebuilding them.
- Evaluate Paperclip before committing to a custom coordinator. Paperclip, PostgreSQL, DBOS, and exact deployment choices remain proposals, not accepted dependencies.
- Preserve provider capabilities through thin adapters. Native execution loops and subagents stay with Claude Code/Codex.
- Delegated work normally runs in its own environment without occupying the user's desktop; management state lives outside agent environments.
- Enforce resource, credential, and authority boundaries outside prompts. Distinguish reported, observed, verified, accepted, and shipped outcomes.
- Use current primary sources; distinguish documented capabilities, design judgments, and untested assumptions.
- Prefer few deployable components with clear ownership and BUILD, INTEGRATE, and OPTIONAL/REPLACEABLE choices.
- Keep modules independently buildable, runnable, and evaluable with supplied inputs or substitutes; do not require an unfinished shared platform for standalone usefulness.
- Keep contracts small and consequential decisions in ADRs. Preserve user changes and original reference material.

## Design entry point

[Architecture review package](docs/architecture/README.md). Follow its current status and decision ledger; historical companion proposals are not current implementation requirements.
