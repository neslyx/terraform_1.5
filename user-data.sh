#!/bin/bash
set -e

TOKEN=$(curl -s -X PUT \
  "http://169.254.169.254/latest/api/token" \
  -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

PRIVATE_IP=$(curl -s \
  -H "X-aws-ec2-metadata-token: $TOKEN" \
  "http://169.254.169.254/latest/meta-data/local-ipv4")

echo "Private IP: $PRIVATE_IP" > home/ubuntu/private-ip-address.txt
