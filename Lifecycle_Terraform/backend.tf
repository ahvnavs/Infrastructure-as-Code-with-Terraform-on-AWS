terraform {
    backend "s3" {
        bucket = ""
        key = ""
        encrypt = true
        region = "ap-south-1"
        use_lockfile = true
    }
}
