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
        region = "ap-south-1"
    }
}

provider "aws" {
    region = "ap-south-1"
}
