#!/bin/bash

AmazonAMI="ami-0f9fc25dd2506cf6d"
Keypair="firstkey"


Assign8id=$(aws ec2 create-security-group --group-name Assign8 --description "Assignment8" --query 'GroupId' --output text)
echo "SG is created"

aws ec2 authorize-security-group-ingress --group-name Assign8 --protocol tcp --port 80 --cidr 0.0.0.0/0

aws ec2 run-instances --image-id "$AmazonAMI" --instance-type t2.nano --key-name "$Keypair" --associate-public-ip-address --user-data file://assig8data.txt \
--security-group-ids "$Assign8id"

echo "vse sdelal, 0 oshibok"
