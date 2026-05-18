# AMI Creation Steps

## 1. Launch Source EC2 Instance
- Created Ubuntu EC2 instance in us-east-1
- Allowed HTTP and SSH access

## 2. Install Nginx
- Installed and enabled nginx web server
- Verified nginx default page in browser

## 3. Apply Basic CIS-Inspired Hardening
- Disabled SSH password authentication
- Disabled root SSH login

## 4. Create Custom AMI
- Created custom AMI from hardened EC2 instance

## 5. Copy AMI Across Regions
- Copied AMI from us-east-1 to us-west-1

## 6. Launch Instance from Copied AMI
- Created new EC2 instance in target region
- Verified nginx page successfully loaded
