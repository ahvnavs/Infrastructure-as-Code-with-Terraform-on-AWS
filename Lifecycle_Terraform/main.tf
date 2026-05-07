provider "aws" {
    region = var.default_region
}

resource "aws_instance" "ec2_instance" {
    ami = ""
    instance_type = var.ec2_instance_type[1]
    region = var.default_region
    availability_zone = var.availability_zone[0]
    associate_public_ip_address = true
    tags = var.tags
    lifecycle {
        create_before_destroy = true
    }
}

resource "aws_s3_bucket" "s3_bucket" {
    bucket = var.s3_bucket_name[0]
    object_lock_enabled = true
    provider = var.provider
    region = var.default_region
    tags = var.tags
}