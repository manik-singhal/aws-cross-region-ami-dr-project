# Snapshot Recovery Steps

## 1. Create EBS Snapshot
- Created snapshot of source EC2 root volume

## 2. Copy Snapshot Across Regions
- Copied snapshot from us-east-1 to us-west-1

## 3. Create Volume from Snapshot
- Created EBS volume using copied snapshot

## 4. Attach Volume to Target Instance
- Attached restored volume to target EC2 instance

## 5. Verify Recovery
- Verified volume attachment in AWS console
