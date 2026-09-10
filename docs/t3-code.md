# T3 Code on Jarvis

Installed and verified 2026-09-10.

- UI: https://jarvis.tail03240d.ts.net:8443/
- Node 24.21.0 in `/opt/node-v24.21.0-linux-x64`, linked from `/usr/local/bin`.
- T3 Code 0.0.40 and Codex CLI 0.154.0 installed under `/home/ubuntu/.local`.
- Supported systemd user service: `t3code.service`, enabled with lingering.
- Data: `/home/ubuntu/.t3`; logs: `/home/ubuntu/.t3/userdata/logs/boot-service.log`.
- Service drop-in: `~/.config/systemd/user/t3code.service.d/environment.conf`.
- Explicit service PATH includes `~/.local/bin`, `/usr/local/bin`, `/usr/bin`, `/bin`.
- Workspace: `/home/ubuntu/code`; registered local repository: `t3-smoke-test`.

T3 listens on `127.0.0.1:3773`. Tailscale Serve proxies HTTPS 8443 to it on
tailnet interfaces only. Funnel is not enabled. Paperclip retains HTTPS 443,
proxying to `127.0.0.1:3100`. T3's native `pair --tailscale` could not mutate
Serve as ubuntu, so the equivalent route was configured once with sudo:

```sh
sudo tailscale serve --https=8443 --bg http://127.0.0.1:3773
```

Manage through `ssh jarvis` from the configured Windows PC:

```sh
~/.local/bin/t3 service status
systemctl --user restart t3code.service
~/.local/bin/t3 pair --ttl 1h
```

For each new device, use the fresh token at the HTTPS UI's pairing page.
The CLI currently prints a localhost pairing URL; replace its origin with
`https://jarvis.tail03240d.ts.net:8443`. Tokens are one-use; never commit them.
After pairing, bookmark the plain UI address.

Verified: HTTPS 200 from the Windows tailnet device, successful browser pairing,
test project visible, Codex version detected in provider settings, loopback
backend and tailnet-only HTTPS listeners, service restart, enabled service and
lingering. Both Paperclip containers remained healthy throughout.

Codex login completed on the VPS: CLI reports `Logged in using ChatGPT`, and
T3 provider settings report `Authenticated · ChatGPT Plus Subscription`.

Pending: GitHub authentication (`gh auth login`), owner Git identity, and an actual agent run.
Claude was not installed. Full VPS reboot and phone access were not tested.

SSH password authentication is disabled and root SSH login is disabled. The
host firewall is not yet enabled; enabling it requires a final maintenance
approval because it changes all inbound host traffic. Until then, port 22 is
still reachable at the public IP but accepts only the authorized SSH key.

Official references:
- https://github.com/pingdotgg/t3code/blob/main/docs/user/install.md
- https://github.com/pingdotgg/t3code/blob/main/docs/user/background-service.md
- https://github.com/pingdotgg/t3code/blob/main/docs/user/remote-access.md
