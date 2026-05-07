variable "default_region" {
    description = "aws region"
    type = string
    default = "ap-south-1"
}

variable "provider" {
    description = "default provider"
    type = string
    default = "aws"
}

variable "ec2_instance_type" {
    description = "different instance types"
    type = list(string)
    default = ["t2.micro", "t2.small", "t3.micro", "t3.small"]
}

variable "availability_zone" {
    description = "list of availability zone in 'ap-south-1'"
    type = list(string)
    default = ["ap-south-1a","ap-south-1b","ap-south-1c"]
}

variable "tags" {
    description = "default tags"
    type = object({
        env = string
        job = string
    })
    default = {
        env = "localdesk"
        job = "terraform lifecycle"
    }
}

variable "s3_bucket_name" {
    description = "s3 bucket name list"
    type = list(string)
    default = ["certainty-acl", "bi-llion-rush", "serve-honour", "bigchill-random"]
}