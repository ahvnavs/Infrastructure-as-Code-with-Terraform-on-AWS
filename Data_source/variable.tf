variable "default_region" {
    description = "default region"
    type = string
    default = "ap-south-1"
}

variable "az" {
    description = "availability zone"
    type = list(string)
    default = ["ap-south-1a","ap-south-1b","ap-south-1c"]
}

variable "instance_type" {
    description = "instance type"
    type = list(string)
    default = ["t2.micro","t3.micro"]
}

variable "tags" {
    description = "tags"
    type = object({
        env = string
        dev = string
    })
    default = {
        dev = "localhost"
        env = "me"
    }
}

variable "aws_vpc" {
    
}
