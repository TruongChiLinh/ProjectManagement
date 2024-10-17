
env_prefix                             = "dev"
vpc_name                               = "dev_env"
cidrvpc                                = "10.0.0.0/16"
enable_nat_gateway                     = true
single_nat_gateway                     = true
enable_dns_hostnames                   = true
create_database_subnet_group           = true
create_database_subnet_route_table     = true
create_database_internet_gateway_route = true
enable_flow_log                        = true
create_flow_log_cloudwatch_iam_role    = true
create_flow_log_cloudwatch_log_group   = true
eks_config = {
  cluster_name                                   = "linhcteks"
  cluster_version                                = "1.30"
  min_size                                       = 3
  max_size                                       = 9
  eks_managed_node_group_defaults_instance_types = ["t2.2xlarge", "t2.large"]
  instance_type                                  = "t2.2xlarge"
  instance_types                                 = ["t2.2xlarge", "t2.large"]
  manage_aws_auth_configmap                      = true
  endpoint_public_access                         = true
  aws_auth_users = [
    {
      userarn  = "arn:aws:iam::084375555299:user/DE000025"
      username = "DE000025"
      groups   = ["system:masters"]
    },
  ]
  cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"],
  eks_cw_logging                       = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
}
vm-config = {
  vm1 = {
    instance_type = "t2.small",
    tags = {
      "ext-name" = "vm2"
      "funct"    = "purpose test"
    }
  },
  vm2 = {
    instance_type = "t2.medium",
    tags          = {}
  }
}
bastion_definition = {
  "bastion" = {
   associate_public_ip_address = false
      bastion_ami                 = "ami-08d50ebc29ee18e79"
      bastion_instance_class      = "t3.medium"
      bastion_monitoring          = true
      bastion_name                = "bastion_ssh"
      bastion_public_key          = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDZDPjo4WOjAHc73bkiQOxtZIpf6c3GwALzRH1g77lGbrXo1rFz164St7V853V1gIntDVk26LucQaUUcvxpAlbRgIxZ3fO27SjXiL9GuAtWgVi5APl5leiqfWOy2eMhT6sbPfrWyzQj5uCB7bCNZBBxMvd5dq+Dh4chkFAyIesHg1anQR7OdLqWxXBuO6hFBMmLKz9L35S4FFaCRatI58RiskgPpsW0ZrQxM6kL4rMqm+6w4aE8eew1xmhNTun8nwwRt7JSmAcYB8EDqPurhZ+7o1Vq9R1HcdoQ38RgHgNRYHgyE9v83PRkiM2ph7HnG45DLJFJmNNZX/v8/N87mnPLTnLR7hVultfF8dgdNCpxgb/d+e/e+LzxCG2Qy4OMQlLxwTgL57Xyz9Odu4qmBNnSDrjOCGqbS/UBIvt+4MJkt3geMJW+RKQy2Ew/czbmJoF8GAo5k5i+B67D2EmCprC2Go7naajOhVrhupJ1FEFy7uASqSFu6k+gPVj0ZS9+Gq8pzc9FvBLbxoKi1VUNMdBm+qqhFbKjSUQmtxSUfystbNX/fxp/lzRpyUBNlHAx8srVAtQDS4BFxvbtf619H4zHAXU9OS/6XeY1x5ZjpV4Uk00P/9eGh994gkU2OPDVlSdZJpElBofO2aHPgdtY9Eyts7vs5BIdJJzSzea3CS7NSw== linhb@gamil.com"
      trusted_ips                 = ["116.108.118.61/32"]
      user_data_base64            = null
      ext-tags = {
        "fucnt" = "demo-tf-ec2"
      }
  }
}
cluster_endpoint_public_access = true
