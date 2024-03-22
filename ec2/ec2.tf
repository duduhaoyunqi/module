locals {
  ec2_config_name      = "ec2.yml"
  ec2_config           = yamldecode(file("${path.module}/${local.ec2_config_name}"))
  ec2_instances         = {for instance in local.ec2_config.ec2_instances: instance.name => instance}  # 遍历list
}

module "ec2_instance" {
    source = "..\\Module-ec2"
    instances = local.ec2_instances
}
