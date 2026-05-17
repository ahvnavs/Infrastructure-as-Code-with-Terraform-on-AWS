variable "default_region" {
    description = "default aws region"
    type = string
    default = "ap-south-1"
}

variable "default_environment" {
    description = "default terraform environment"
    type = string
    default = "not_localdesk"
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


variable "ingress_rules" { #list of object, dynamic block
    description = "list of ingress rules for security group"
    type = list(object({
        form_port = number
        to_port = number
        protocol = string
        cidr_block = list(string)
        description = string
    }))
    default = [ {
        form_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_block = [ "0.0.0.0/0" ]
        description = "HTTP"
    },{
        form_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_block = [ "0.0.0.0/0" ]
        description = "HTTPS"
    } ]
}
