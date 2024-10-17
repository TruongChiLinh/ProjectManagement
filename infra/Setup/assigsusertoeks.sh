#!/bin/bash

AWS_REGION=eu-west-3
EKS_CLUSTER_NAME=linhcteks
AWS_USER_ARN=arn:aws:iam::084375555299:user/DE000025
AWS_USERNAME=DE000025
TYPE_ACCESS=cluster
POLICY_ARN=arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy

aws eks create-access-entry --cluster-name $EKS_CLUSTER_NAME --principal-arn $AWS_USER_ARN  --type STANDARD --user $AWS_USERNAME --kubernetes-groups Viewers --region $AWS_REGION

aws eks associate-access-policy --cluster-name $EKS_CLUSTER_NAME --region $AWS_REGION --principal-arn $AWS_USER_ARN  --access-scope type=cluster --policy-arn arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy