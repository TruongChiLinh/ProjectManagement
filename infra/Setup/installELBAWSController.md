Install eksctl https://eksctl.io/installation/


Ref: https://docs.aws.amazon.com/eks/latest/userguide/lbc-helm.html

add the iam policy
step 1: curl -O https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.7.2/docs/install/iam_policy.json

step 2: aws iam create-policy \
    --policy-name CLAWSLoadBalancerControllerIAMPolicy \
    --policy-document file://iam_policy.json \
    --profile vti

add  iam open id

eksctl utils associate-iam-oidc-provider --region=ap-northeast-3 --cluster=linheks --approve

add service account

eksctl create iamserviceaccount \
--override-existing-serviceaccounts \
--cluster=linheks \
--namespace=kube-system \
--name=awsalb-controller \
--role-name CLAmazonEKSLoadBalancerControllerRole \
--attach-policy-arn=arn:aws:iam::084375555299:policy/CLAWSLoadBalancerControllerIAMPolicy \
--approve \
--region ap-northeast-3

add helm

helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
-n kube-system \
--set clusterName=linheks \
--set serviceAccount.create=false \
--set serviceAccount.name=awsalb-controller \
--set region=ap-northeast-3 \
--set vpcId=vpc-0dd3900e1dd0ebe04

verify

kubectl get deployment -n kube-system aws-load-balancer-controller

```sh {"id":"01J8MRBEVD2D0WAZQ0PF9VC61J"}
setup game to test

curl -O https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.7.2/docs/examples/2048/2048_full.yaml

kubectl apply -f 2048_full.yaml


```