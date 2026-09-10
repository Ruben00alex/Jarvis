# JARVIS server

Current milestone: a VPS with Docker running Paperclip. Agent connections,
assignments, and briefings are not part of this setup.

## Installation

- OVHcloud VPS: `vps-a37cb2e0.vps.ovh.ca`, IPv4 `148.113.179.130`.
- Beauharnois, Canada; Ubuntu 24.04; 4 vCPU, 8 GB RAM, 75 GB disk.
- Docker Engine 29.8.0; Docker Compose 5.5.1.
- Paperclip v2026.831.1, commit `65ec059bde30d98c92165b24a30a540800dd1f6f`.
- Official image pinned to `sha256:f58ff8e28757eaaf1f58b7ae608e56f2a473fd0688aaab2dbade8c392fad0758`.
- PostgreSQL 17 Alpine.
- Deployment configuration: `/opt/jarvis/compose.yaml` on the VPS.
- Secrets: `/opt/jarvis/.env`, generated on the VPS with mode 600; never copy into Git.
- Named volumes: `jarvis_pgdata` and `jarvis_paperclip-data`.
- Application binds only to `127.0.0.1:3100`; PostgreSQL has no host-published port.
- Agent heartbeat scheduling is disabled for this installation milestone.

The Compose file is adapted from the pinned upstream release. It uses the
official prebuilt image, generated secrets, loopback-only access, restart
policies, health checks, persistent volumes, and bounded container logs.
Upstream source is available at `/opt/jarvis/paperclip-src` for reference;
it is not needed to start the prebuilt image.

## Connect from this Windows computer

See [Access Paperclip](access.md) for double-click Windows launchers, manual
tunnels, new-device authorization, mobile access, and troubleshooting.

SSH key files are in `C:\Users\Alex\.ssh\jarvis_ovh_ed25519` and the corresponding
`.pub` file. Keep the private key on this computer, outside this repository.

```powershell
ssh -i C:/Users/Alex/.ssh/jarvis_ovh_ed25519 ubuntu@148.113.179.130
```

To open Paperclip, run the background tunnel launcher:

```powershell
& G:/Astra/Jarvis/deploy/open-paperclip.ps1
```

It starts a hidden SSH process independently of the assistant session and checks
the application health endpoint. Run it again after a Windows restart or if the
tunnel exits following a network interruption. It does not automatically reconnect.

Alternatively, keep this tunnel running in a terminal:

```powershell
ssh -i C:/Users/Alex/.ssh/jarvis_ovh_ed25519 -o ExitOnForwardFailure=yes -o ServerAliveInterval=30 -N -L 127.0.0.1:3100:127.0.0.1:3100 ubuntu@148.113.179.130
```

Then open <http://localhost:3100>. If port 3100 is already occupied by an existing
tunnel, use that tunnel rather than starting another. Closing the tunnel stops
browser access from this computer; Paperclip keeps running on the VPS.

Initial access uses SSH forwarding. Tailscale 1.102.3 is installed from its
official Ubuntu repository, with tailscaled enabled at boot. Enrollment was
started with hostname `jarvis` and `--accept-dns=false`; owner sign-in is pending.
Private HTTPS Serve and Paperclip's corresponding URL still need configuration
after enrollment. Existing SSH access remains available.

## Manage the installation

Run these commands after connecting over SSH:

```sh
cd /opt/jarvis
sudo docker compose ps
sudo docker compose logs --tail=100 server
sudo docker compose logs --tail=100 db
sudo docker compose restart
sudo docker compose stop
sudo docker compose start
curl -fsS http://127.0.0.1:3100/api/health
```

Do not use `docker compose down -v`: it deletes persistent volumes.
Changing the image tag in the example does not update the deployed image:
the server's `.env` pins its digest. Updates are an explicit later operation.

## Reproduce configuration

Copy `deploy/compose.yaml` to `/opt/jarvis/compose.yaml`. Create a `.env` based on
`deploy/.env.example`, generating each secret independently with
`openssl rand -hex 32`, and restrict its permissions to 600. Use hex for the
database password so it is safe in the connection URL. Then run:

```sh
cd /opt/jarvis
sudo docker compose config --quiet
sudo docker compose up -d --wait
```

Never print the fully resolved Compose configuration in shared logs because
it contains secrets.

## Verification

Verified: SSH key login with sudo access, Docker hello-world, both containers
healthy, pinned Paperclip commit in `/api/health`, and the initial setup page
opening through the SSH tunnel.

Verified after a full VPS reboot: Docker starts automatically and both existing
containers return healthy with the same persistent volumes and Paperclip commit.
The owner account has claimed the instance. The Jarvis organization was created
successfully and its dashboard opens at <http://localhost:3100/JAR/dashboard>.
An onboarding "Failed to fetch" error was caused by the local SSH tunnel exiting;
restarting it independently with the background launcher restored access.
No model providers or production credentials have been configured.
Backup restoration and real agent execution have not been tested.
