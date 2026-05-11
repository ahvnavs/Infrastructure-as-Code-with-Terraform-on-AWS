variable "default_region" {
    description = "default aws region"
    type = string
    default = "ap-south-1"
}

variable "default_environment" {
    description = "default terraform environment"
    type = string
    default = "localdesk"
}

variable "instance_type" {
    description = "ec2 instance type"
    type = list(string)
    default = ["t2.micro", "t3.micro", "t2.small", "t2.large"]
}

variable "availability_zone" {
    description = "availability zone for default region"
    type = list(string)
    default = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
}

variable "tags" {
    description = "default tags"
    type = object({
        environment = string
        provider = string
    })
    default = {
        environment = "localdesk"
        provider = "aws"
    }
}

variable "instance_count" {
    description = "number of ec2 instance to create"
    type = number
}