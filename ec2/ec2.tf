locals {
  ec2_config_name      = "ec2.yml"
  ec2_config           = yamldecode(file("${path.module}/${local.ec2_config_name}"))
  ec2_instances         = {for instance in local.ec2_config.ec2_instances: instance.name => instance}  # Terraform For expression
}

module "ec2_instance" {
    source = "..\\Module-ec2"
    instances = local.ec2_instances
}

# 查看返回的object结果
# $ terraform console
# > {for instance in local.ec2_config.ec2_instances: instance.name => instance}
# {
#   "wpfblogirbrd01" = {
#     "ami" = "ami-09b1e8fc6368b8a3a"
#     "name" = "wpfblogirbrd01"
#     "subnet_id" = "subnet-0bd4d44232932bbc3"
#     "type" = "t2.micro"
#   }
#   "wpfblogirbrd02" = {
#     "ami" = "ami-09b1e8fc6368b8a3a"
#     "name" = "wpfblogirbrd02"
#     "subnet_id" = "subnet-0bd4d44232932bbc3"
#     "type" = "t2.micro"
#   }
# }
