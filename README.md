# AWS Cross-Region AMI & Disaster Recovery

A hands-on AWS project demonstrating custom AMI creation, cross-region replication, and disaster recovery using EBS snapshots and volume restoration.

Built as part of the **DevOps + SRE Daily Challenge Series**.

---

## Architecture

```
Source Region: us-east-1 (N. Virginia)
Target Region: us-west-1 (N. California)

EC2 (us-east-1)
   ↓ Nginx + SSH Hardening
Custom AMI
   ↓ Copy AMI
EC2 (us-west-1) ← Launched from copied AMI

EBS Snapshot (us-east-1)
   ↓ Copy Snapshot
EBS Volume (us-west-1) ← Restored and attached
```

---

## Project Structure

```
aws-cross-region-ami-dr-project/
├── README.md
├── .gitignore
├── scripts/
│   ├── install-nginx.sh
│   └── cis-hardening.sh
├── docs/
│   ├── ami-creation-steps.md
│   ├── snapshot-recovery-steps.md
│   ├── troubleshooting.md
│   └── manual-aws-console-steps.md
├── architecture/
│   └── architecture-diagram.png
└── screenshots/
```

---

## Tech Stack

| Tool | Usage |
|---|---|
| AWS EC2 | Compute instances in source and target regions |
| AWS AMI | Custom machine image creation and replication |
| AWS EBS | Block storage, snapshots, and volume restoration |
| Ubuntu Linux | Base OS for EC2 instances |
| Nginx | Web server installed and verified across regions |
| Bash | Automation scripts for setup and hardening |

---

## Workflow

### 1. Launch Source EC2 Instance

Launched an Ubuntu EC2 instance in `us-east-1` with ports 22 (SSH) and 80 (HTTP) open.

### 2. Install Nginx

```bash
sudo apt update && sudo apt install nginx -y
```

Verified the nginx page was accessible in the browser.

### 3. Apply Basic CIS-Inspired SSH Hardening

```bash
sudo nano /etc/ssh/sshd_config
```

Updated the following:

```
PasswordAuthentication no
PermitRootLogin no
```

```bash
sudo systemctl restart ssh
```

### 4. Create Custom AMI

Created a custom AMI from the hardened instance via:

```
EC2 → Images → Create Image
```

### 5. Copy AMI to Target Region

Copied the AMI from `us-east-1` to `us-west-1` via:

```
Actions → Copy AMI
```

### 6. Launch Instance from Copied AMI

Launched a new EC2 instance in `us-west-1` from the copied AMI and verified nginx was running.

### 7. Create and Copy EBS Snapshot

Created a snapshot of the source EC2 root volume, then copied it from `us-east-1` to `us-west-1`.

### 8. Restore Volume from Snapshot

Created a new EBS volume from the copied snapshot and attached it to the target EC2 instance.

> Note: The EBS volume and EC2 instance must be in the same availability zone before attaching.

---

## Challenges and Learnings

**What was tricky:**

- SSH hardening was baked into the AMI, which locked SSH access on all instances launched from it. A good lesson in how immutable images carry configuration changes forward.
- AWS key pairs are region-specific — a new key pair had to be created in `us-west-1`.
- EBS volume attachment failed until the volume and instance were moved to the same availability zone.

**What this project strengthened:**

- How AMIs capture complete machine state
- Cross-region replication for disaster recovery
- Snapshot-based storage backup and restoration
- Immutable infrastructure thinking
- Real-world DR workflow across AWS regions

---

## Screenshots

| Screenshot | Description |
|---|---|
| `custom-hardened-ami-us-east-1.png` | Custom AMI created in source region |
| `ami-replicated-to-us-west-1.png` | AMI copied to target region |
| `ebs-snapshot-created.png` | EBS snapshot of source volume |
| `cross-region-ebs-snapshot.png` | Snapshot copied to target region |
| `ebs-volume-restored-from-snapshot.png` | Restored EBS volume |
| `nginx-source-instance.png` | Nginx running in us-east-1 |
| `nginx-target-instance.png` | Nginx running in us-west-1 |

---

## Author

**Manik Singhal**
