variable "region" {
  type    = string
  default = "us-east-2"
}

variable "vpc_cidr_block" {
  default = "20.0.0.0/16"
}

variable "subnet_cidr_blocks" {
  default = {
    "subnet1" = "20.0.1.0/24"
    "subnet2" = "20.0.2.0/24"
    "subnet3" = "20.0.3.0/24"
  }
}

variable "tag_name" {
  description = "tag for subnet"
  type = string
  default = "mysubnet_"
}
