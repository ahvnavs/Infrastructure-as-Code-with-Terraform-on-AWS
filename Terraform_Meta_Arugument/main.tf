provider "aws" {
    region = var.default_aws_region
}

resource "aws_s3_bucket" "bucket_01" {
    count = length(var.s3_bucket_name)  #list
    bucket = var.s3_bucket_name[count.index]
    object_lock_enabled = true
    region = var.default_aws_region
    tags = var.default_tags
    provider = aws
    depends_on = [ aws_s3_bucket.bucket_02 ]
}

resource "aws_s3_bucket" "bucket_02" {
    for_each = var.s3_bucket_name_set #set
    bucket = each.value #can_use_each.key/each.value
    object_lock_enabled = true
    tags = var.default_tags
    provider = aws
}
