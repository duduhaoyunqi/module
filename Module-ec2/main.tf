resource "aws_instance" "this" {
  # 接收到instances这个variable后遍历
  for_each = var.instances

  # 左边的attribute是terraform aws provider定义好的，不能自定义名称。
  ami           = each.value.ami
  instance_type = each.value.type
  subnet_id = each.value.subnet_id
}
