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
    default = ["meta-argument-bucket-aws-s3-newgen", "nan-ang-ni-gga", "study-alot-u-007"]
}

variable "s3_bucket_name_set" {
    description = "set value name of bucket"
    type = set(string)
    default = [ "n-i-g-g-a-h-c-l", "kamehamehaaaaa", "dragondragonbouncy-dragon" ]
}
