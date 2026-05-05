variable "default_aws_region" {
    description = "default aws region"
    type = string
    default = "ap-south-1"
}

variable "default_tags" {
    description = "tags"
    type = object({
        environment = string
        language = string
        provider = string
    })
    default = {
        environment = "localdesk"
        language = "hcl"
        provider = "aws"
    }
}

variable "s3_bucket_name" {
    description = "differnt s3 bucket names"
    type = list(string)
    default = ["meta-argument-bucket-aws-s3", "nan-ang-ni-gga", "study-alot-u-007"]
}
