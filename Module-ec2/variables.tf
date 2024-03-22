variable "instances" {}

# variable "instances" {
#     type = map(object({
#     ami = string
#     instance_type = string
#     subnet_id = string
#   }))
#   default = {
#     instance1 = {
#       ami = "ami-09b1e8fc6368b8a3a"
#       instance_type = "t2.micro"
#       subnet_id = "subnet-0bd4d44232932bbc3"
#     },
#     instance2 = {
#       ami = "ami-09b1e8fc6368b8a3a"
#       instance_type = "t2.micro"
#       subnet_id = "subnet-0bd4d44232932bbc3"
#     },
#     instance3 = {
#       ami = "ami-09b1e8fc6368b8a3a"
#       instance_type = "t2.micro"
#       subnet_id = "subnet-0bd4d44232932bbc3"
#     }
#   }

# }
