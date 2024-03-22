resource "aws_instance" "this" {
  for_each = var.instances
  ami           = each.value.ami
  instance_type = each.value.type
  subnet_id = each.value.subnet_id
}
