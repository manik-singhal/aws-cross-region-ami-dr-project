# Manual AWS Console Workflow

## AMI Creation
1. Launched Ubuntu EC2 instance in us-east-1
2. Installed nginx and applied SSH hardening
3. Created custom AMI from EC2 instance using:
   EC2 → Images → Create Image

## Cross-Region AMI Copy
1. Selected created AMI
2. Used:
   Actions → Copy AMI
3. Copied AMI from us-east-1 to us-west-1

## Launching Instance from Copied AMI
1. Switched region to us-west-1
2. Launched EC2 instance from copied AMI
3. Verified nginx webpage

## Snapshot Creation
1. Opened EC2 → Volumes
2. Selected source EBS volume
3. Created snapshot

## Snapshot Copy Across Regions
1. Opened EC2 → Snapshots
2. Selected snapshot
3. Used:
   Actions → Copy Snapshot
4. Copied snapshot to us-west-1

## Volume Restoration
1. Created new EBS volume from copied snapshot
2. Attached restored volume to target EC2 instance
