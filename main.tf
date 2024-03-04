provider "aws" {
  region = var.region
}

resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr_block

  tags = {
    Name = "Myvpc"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "examples" {
  count                  = length(data.aws_availability_zones.available.names)
  vpc_id                 = aws_vpc.main.id
  cidr_block             = values(var.subnet_cidr_blocks)[count.index]
  availability_zone      = data.aws_availability_zones.available.names[count.index]

tags = {
  Name = "${var.tag_name}${count.index + 1}"
  }
}

output "subnetids" {
  value       = aws_subnet.examples.*.id
  description = "The subnets created were"
}
