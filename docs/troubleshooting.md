# Troubleshooting Notes

## SSH Access Issue After Hardening
After applying SSH hardening, SSH access stopped working on copied instances because the hardened SSH configuration was baked into the AMI.

## Region-Specific Key Pair
AWS key pairs are region-specific. A new key pair had to be created in us-west-1.

## Availability Zone Mismatch
While attaching EBS volume, the volume and EC2 instance had to be in the same availability zone.

## AMI Copy Delay
Cross-region AMI copy took several minutes before becoming available.
