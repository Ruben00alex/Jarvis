# Open Paperclip from your devices

Tailscale setup is in progress: the VPS has Tailscale installed and enabled at
boot, pending owner sign-in. Once enrollment and private HTTPS configuration are
complete, everyday access will use Tailscale and a shared private URL. Until then,
the SSH access below remains available.

Paperclip runs on the VPS even when your computer is off. Your browser reaches
it through an SSH tunnel running on the device you are using. `localhost` means
that device: opening the same URL on a phone requires a tunnel on the phone too.

The dashboard is <http://localhost:3100/JAR/dashboard>. Sign in with your existing
Paperclip account; do not create a new organization on each device. SSH access
and your Paperclip login are two separate things.

## This Windows computer: double-click

1. Open the repository's `deploy` folder and double-click **Open Paperclip.bat**.
2. The launcher starts the tunnel if needed, checks Paperclip, and opens your
   default browser. You can close the launcher window and keep using Paperclip.
3. To disconnect, double-click **Stop Paperclip Tunnel.bat**. This only stops
   the local connection; it does not stop Docker or Paperclip on the VPS.

You can create desktop shortcuts to these batch files. Keep the batch files
beside their `.ps1` companion files; the launchers work from any folder location.
They use Windows PowerShell and `ssh.exe`, already available on this computer.
The SSH key is read from `%USERPROFILE%\.ssh\jarvis_ovh_ed25519`.

Run Open Paperclip again after restarting Windows or after a dropped connection.
The launcher does not install a startup task or automatically reconnect.
If the page shows **Failed to fetch**, reopen the launcher and refresh the page.

## Set up another computer once

Each device needs an SSH client and an authorized key. Generate a separate key
on each device so you can revoke a lost device independently. Keep private keys
out of this repository and chat; only the `.pub` file is shared with the server.

On Windows, run these in PowerShell (install the Windows OpenSSH Client optional
feature if `ssh` is unavailable):

```powershell
New-Item -ItemType Directory -Force "$env:USERPROFILE/.ssh" | Out-Null
ssh-keygen -t ed25519 -f "$env:USERPROFILE/.ssh/jarvis_ovh_ed25519"
Get-Content "$env:USERPROFILE/.ssh/jarvis_ovh_ed25519.pub"
```

On macOS or Linux, run these in Terminal:

```sh
mkdir -p ~/.ssh
chmod 700 ~/.ssh
ssh-keygen -t ed25519 -f ~/.ssh/jarvis_ovh_ed25519
cat ~/.ssh/jarvis_ovh_ed25519.pub
```

Do not overwrite a key that already exists. The key generator asks for a
passphrase. A passphrase-protected key works with the manual command below;
the Windows background launcher requires an unlocked key in `ssh-agent` or a
key without a passphrase because it cannot display password prompts.

Authorize the new key using this already-connected Windows computer:

```powershell
ssh -i "$env:USERPROFILE/.ssh/jarvis_ovh_ed25519" ubuntu@148.113.179.130
```

In that VPS shell, run:

```sh
mkdir -p ~/.ssh
chmod 700 ~/.ssh
cat >> ~/.ssh/authorized_keys
```

Paste the new device's complete `ssh-ed25519 ...` **public key** on one line,
press Enter, then Ctrl+D. Finish with:

```sh
chmod 600 ~/.ssh/authorized_keys
exit
```

On the new device, connect once interactively using the appropriate command:

```powershell
# Windows PowerShell
ssh -i "$env:USERPROFILE/.ssh/jarvis_ovh_ed25519" ubuntu@148.113.179.130
```

```sh
# macOS / Linux
ssh -i ~/.ssh/jarvis_ovh_ed25519 ubuntu@148.113.179.130
```

For the first connection, compare the ED25519 server fingerprint before accepting:

```text
SHA256:RbrLmoNiy2J2et3u0IgxDbegwGwuqlT0WTJmIZ4j84Q
```

Type `exit` once logged in. On a new Windows computer, copy the four launcher
files from `deploy` together and use Open Paperclip.bat. Otherwise use the manual
tunnel below. New-device steps are documented but have not been tested on your
other devices.

## Start a tunnel manually

Windows PowerShell:

```powershell
ssh -i "$env:USERPROFILE/.ssh/jarvis_ovh_ed25519" -o IdentitiesOnly=yes -o ExitOnForwardFailure=yes -o ServerAliveInterval=30 -o ServerAliveCountMax=3 -N -L 127.0.0.1:3100:127.0.0.1:3100 ubuntu@148.113.179.130
```

macOS / Linux Terminal:

```sh
ssh -i ~/.ssh/jarvis_ovh_ed25519 -o IdentitiesOnly=yes -o ExitOnForwardFailure=yes -o ServerAliveInterval=30 -o ServerAliveCountMax=3 -N -L 127.0.0.1:3100:127.0.0.1:3100 ubuntu@148.113.179.130
```

A quiet terminal is normal. Leave it open, then visit
<http://localhost:3100/JAR/dashboard>. Press Ctrl+C to disconnect. You do not need
to run Docker on your computer. The command forwards your local port 3100 through
encrypted SSH to Paperclip's loopback port on the VPS.

## iPhone, iPad, and Android

Use an SSH app that supports **local port forwarding**, such as Termius. Its
[mobile guide](https://termius.com/blog/8-tips-for-using-ai-agents-on-mobile-in-termius)
describes local forwarding for browser access. Check current app feature access
before choosing a plan; this installation does not require buying a subscription.

Create a key in the app and authorize its public key using the steps above. Add
a host and a local forwarding rule with these values:

| Setting | Value |
| --- | --- |
| SSH host | `148.113.179.130` |
| SSH port | `22` |
| SSH username | `ubuntu` |
| Authentication | The device's authorized SSH key |
| Forwarding type | Local |
| Local bind address | `127.0.0.1` |
| Local port | `3100` |
| Destination host (from VPS) | `127.0.0.1` |
| Destination port | `3100` |

Verify the host fingerprint above, start the connection/forwarding rule, then
open <http://localhost:3100/JAR/dashboard> in the device's browser. Keep the SSH
connection active. Mobile operating systems may suspend the app in the background;
if access drops, reconnect in the SSH app and refresh. This mobile flow has not
been verified on your phone.

For routine phone access, a future Tailscale setup could provide a private HTTPS
address without opening an SSH app each time. That requires installing/enrolling
Tailscale, configuring Serve, and updating Paperclip's public URL/authentication
settings. Tailscale is installed on the VPS, but enrollment and HTTPS access are
**not complete yet**. Tailscale documents how
[Serve routes a private service](https://tailscale.com/docs/features/tailscale-serve).

## Troubleshooting

| Symptom | Action |
| --- | --- |
| Failed to fetch / localhost refuses connection | Start the tunnel on this device, then refresh. |
| Permission denied (publickey) | Check the key path and that this device's public key is in the VPS user's authorized_keys. Unlock a protected key or use the interactive command. |
| Host key verification failed | Connect interactively and compare the fingerprint above. If a previously trusted key changed, investigate before replacing it. |
| Address already in use / port 3100 occupied | Reuse the working tunnel. If another application owns the port, close that application before retrying; the stop launcher refuses to kill unrelated processes. |
| SSH times out | Check internet access and whether your network permits outbound SSH on port 22; check VPS status in OVHcloud. |
| Tunnel works but Paperclip does not | Use the health and container commands in [Operations](operations.md). |
| Page fails after sleep or switching networks | Reopen the launcher or reconnect the manual/mobile tunnel. |

Use `localhost` consistently in the browser because that is Paperclip's configured
public URL. Browsing directly to the VPS IP on port 3100 does not work: the service
is deliberately bound to the VPS loopback interface. A borrowed device with only
a browser cannot access this deployment without first establishing private access.

If a device is lost, remove its public key line from
`/home/ubuntu/.ssh/authorized_keys` using another authorized device. This prevents
new SSH logins; separately terminate existing sessions and revoke Paperclip
sessions as needed.
