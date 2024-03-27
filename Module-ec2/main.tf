data "aws_subnet" "ec2_instance" {
  for_each = var.instances
  filter {
    name   = "tag:Name"
    values = [each.value.subnet]
  }
}

resource "aws_instance" "this" {
  # 接收到instances这个variable后遍历
  for_each = var.instances

  # 左边的attribute是terraform aws provider定义好的，不能自定义名称。
  ami           = each.value.ami 
  instance_type = each.value.type  # extract "type" attribute from each object
  subnet_id = data.aws_subnet.ec2_instance[each.key].id
  key_name  = try(each.value.key_name, null)
}
