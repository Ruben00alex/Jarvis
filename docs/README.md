# JARVIS

A personal workspace that helps Alex build and operate SaaS products: plan work, assign agents, review results, and keep projects moving across devices.

## Why this exists

Alex is a solo software engineer who wants to build SaaS products and manage the sites and businesses around them. Coding is only part of that work: planning, research, testing, reviews, operational follow-up, and deciding what to do next all compete for one person's attention.

The immediate frustration is coordinating agents through separate chats. Each assignment needs prompting, progress is scattered across conversations, and switching devices means reconstructing context. Agents mostly work only when asked. Alex wants help acting as the project manager: define an outcome, leave bounded work available, and come back to useful deliverables and decisions.

JARVIS originally described a broad autonomous companion with voice, personal memory, and an Omarchy-centered desktop. That scope has been replaced by this practical SaaS workspace. The useful inspiration from the Ben Davis video was Tailscale, SSH, always-on execution, and access from anywhere. Infrastructure learning is not a product objective.

## What the experience should provide

| Need | Desired experience |
| --- | --- |
| Plan a project | Discuss an objective with an agent and get tasks, dependencies, acceptance criteria, and questions to resolve. |
| Delegate ongoing work | Authorize a bounded milestone or queue; agents advance eligible tasks without a fresh prompt for each one. |
| Know what is happening | See running work, failures, capacity waits, blockers, and the next decision in one place. |
| Review useful results | Open a diff, report, preview, or test result with a concise explanation; transcripts remain available for diagnosis. |
| Receive recurring output | Schedule a briefing or other assignment with a defined deliverable, rather than manually asking every morning. |
| Continue on another device | Open the same projects, results, and decisions from a laptop or phone while work continues on the server. |

These are desired outcomes to map onto Paperclip's existing interface. They do not prescribe six new screens or a replacement application.

## A concrete working day

For example, Alex gives an agent a bounded onboarding milestone for a SaaS project. The agent proposes tasks and highlights an unresolved invitation-expiry rule. Alex settles the scope, and eligible implementation work proceeds on the server while the laptop is closed.

Later, Alex opens the workspace on a phone and sees a change linked to its commit, test results, and a preview where available. A requested revision stays attached to that work. The next briefing explains what changed, what remains blocked, and which decision needs attention. This is the target experience, not a demonstration already completed.

## First version

Use Paperclip as the starting foundation on one rented VPS, with Docker Compose, Tailscale, and SSH. Prove its integration with a subscription-authenticated Claude Code or Codex before relying on unattended work.

The useful workflow is simple:

1. Give a project an objective and a bounded set of tasks.
2. Let agents work within that scope while the laptop is closed.
3. Review changes, checks, reports, and blockers from another device.
4. Receive a scheduled briefing with what changed and what needs a decision.

All AI work uses Alex's Claude or ChatGPT Pro subscription, including planning and reports. No metered model APIs, paid fallback, or automatic extra spending. Work waits when included usage is unavailable.

## Why these starting choices

Alex independently found Paperclip and described it as almost exactly what he wanted. It is the preferred foundation to try. The first engineering work should be installing and configuring the existing product, testing the native agent connection, and shaping a useful workflow. Actual compatibility is still unverified; a specific failed requirement should justify any custom extension.

A rented VPS avoids buying dedicated hardware before knowing how long this setup will be useful. Alex considered a small machine beside the router and a temporary setup on his main computer, but does not want the main computer running 24/7. The VPS is now the selected starting host. The roughly $10/month discussion expressed a low-cost preference, not a selected offer or verified break-even calculation.

Docker Compose is the intended service packaging approach so configuration and persistent data can move to another host later. Tailscale supplies private device connectivity and SSH supplies administration. The user's desktop OS should not determine whether the workspace is usable.

## Scope and success

The first useful version has one owner, one VPS, one project, one working provider, and one recurring briefing. Both Claude Code and Codex remain intended providers; connect the second after the first workflow works. Review can initially use the platform's existing task comments and links if they clearly identify the result being reviewed.

Judge usefulness by whether Alex spends less time restarting work and reconstructing context, can make decisions from the results, and gets accepted changes toward a real milestone. Agent count, constant activity, and transcript volume are not success measures.

Later increments may include quality investigations from CI results, source-backed customer-feedback summaries, richer previews, or Telegram/WhatsApp notifications. Each should address an observed need. Native mobile apps, multiple hosts, general companion features, and a custom orchestration framework are outside the first version.

## Where to start

- [Architecture](architecture.md): decisions, component ownership, and essential operating rules.
- [Setup handoff](handoff.md): the next steps and what counts as a working first version.
- [Access Paperclip](access.md): Windows launchers, SSH tunnels, and setup for other computers and mobile devices.

Current status: the first infrastructure milestone is complete on an OVHcloud VPS in Beauharnois (Ubuntu 24.04, 4 vCPU, 8 GB RAM, 75 GB disk). Docker Compose runs Paperclip v2026.831.1 and PostgreSQL with persistent volumes. Both services passed health checks after a VPS reboot. The owner account has claimed the instance, the Jarvis organization is created, and its dashboard opens through a private SSH tunnel. See [Operations](operations.md) for access and commands.

The current milestone is only VPS + Docker + Paperclip. Tailscale enrollment, provider integration, assignments, and briefings are follow-ups, not acceptance requirements for this installation.

Start with the existing Paperclip interface and scheduling. Add custom functionality only for an observed gap. Messaging integrations, multiple hosts, voice, personal memory, and automatic production releases can wait.

The original architecture brief and Ben Davis transcript in the repository root are reference material. The larger design package is recoverable from Git commit `44c727b`; these three documents replace it.
