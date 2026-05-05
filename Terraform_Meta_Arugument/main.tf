provider "aws" {
    region = var.default_aws_region
}

resource "aws_s3_bucket" "bucket_01" {
    bucket = var.s3_bucket_name[0]
    object_lock_enabled = true
    region = var.default_aws_region
    tags = var.default_tags
    provider = var.default_tags.provider
}

resource "aws_s3_bucket_versioning" "version_01" {
    depends_on = [ aws_s3_bucket.bucket_01 ]
    provider = var.default_tags.provider
    bucket = aws_s3_bucket.bucket_01.id
    versioning_configuration = {
        status = "Enabled"
    }
}
