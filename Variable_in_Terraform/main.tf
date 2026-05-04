variable "region" {
    default = "ap-south-1"
}

variable "environment" {
    default = "localdesk"
    type = string
}

terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 6.0"
        }
    }
    backend "s3"{
        bucket = "statefile-remote-backend-s3-ahvnav"
        encrypt = true
        key = "statefile/terraform.tfstate"
        use_lockfile = true
    }
}

provider "aws" {
    region = var.region
}

locals {
    bucket_name = "mylocals3bucket-${var.environment}"
    vpc_name = "mylocalvpc-${var.environment}"
}

resource "aws_s3_bucket" "s3bucket" {
    bucket = local.bucket_name
    force_destroy = true
    object_lock_enabled = true
    tags = {
        environment = var.environment
    }
}

resource "aws_vpc" "local_vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true
    enable_network_address_usage_metrics = true
    region = var.region
    tags = {
        environment = var.environment
    }
}

output "vpc_id" {
    value = aws_vpc.local_vpc.id
}
