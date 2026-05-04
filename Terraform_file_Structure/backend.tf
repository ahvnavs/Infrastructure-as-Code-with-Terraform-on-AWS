terraform {
    backend "s3" {
        bucket = "statefile-remote-backend-s3-ahvnav"
        key = "statefile/terraform.tfstate"
        region = "ap-south-1"
        encrypt = true
        use_lockfile = true
    }
}
