terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 6.0"
        }
    }
    backend "s3" {
        bucket = "statefile-remote-backend-s3-ahvnav"
        key = "statefile/terraform.tfstate"
        region = "ap-south-1"
        encrypt = true
        use_lockfile = true
    }
}

provider "aws" {
    region = "ap-south-1"
}
