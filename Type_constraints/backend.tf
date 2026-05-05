terraform {
    backend "s3" {
        bucket = ""
        encrypt = true
        key = ""
        use_lockfile = true
        region = "ap-south-1"
    }
}