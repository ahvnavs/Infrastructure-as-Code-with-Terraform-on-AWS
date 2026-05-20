provider "aws" {
    region = var.default_region
}

resource "aws_instance" "ec2_01" {
    ami = data.aws_ami.ec2_ami.id
    subnet_id = data.aws_subnet.shared.id
    availability_zone = var.az[0]
    associate_public_ip_address = true
    instance_type = var.instance_type[0]
    tags = var.tags
}

resource "aws_vpc" "vpc_01" {
    cidr_block = ""
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = var.tags
}

resource "aws_subnet" "sub_net" {
    vpc_id = data.aws_vpc.selected.id
    availability_zone = var.az[0]
    cidr_block = ""
}
