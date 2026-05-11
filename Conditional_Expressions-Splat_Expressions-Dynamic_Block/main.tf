provider "aws" {
    region = var.default_region
}

resource "aws_instance" "ec2_instance" {
    ami = "ami-0912f71e06545ad88"
    availability_zone = var.availability_zone[0]
    associate_public_ip_address = true
    count = var.instance_count
    #instance_type = var.instance_type[0]
    instance_type = var.default_environment == "localdesk" ? var.instance_type[0] : var.instance_type[1]
    lifecycle {
        create_before_destroy = true
    }
    monitoring = true
    provider = aws
    region = var.default_region
    tags = var.tags
}