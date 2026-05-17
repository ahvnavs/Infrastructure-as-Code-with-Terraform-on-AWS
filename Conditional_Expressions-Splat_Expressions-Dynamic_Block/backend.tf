terraform {
    backend "s3" {
        bucket = "statefile-remote-backend-s3-ahvnav"
        key = "statefile/terraform.tfstate"
        encrypt = true
        region = "ap-south-1"
        use_lockfile = true
    }
}
