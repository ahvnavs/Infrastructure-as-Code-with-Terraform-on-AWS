variable "defaultregion" {
    description = "default region of aws"
    default = "ap-south-1"
    type = string
}

variable "defaultcount" {
    description = "number ec2 instance to create"
    default = 1
    type = number
}

variable "monotoring_enabled" {
    description = "enable monitoring of ec2"
    default = true
    type = bool
}

variable "associate_public_ip" {
    description = "public ip"
    default = true
    type = bool
}

variable "cidr_block" {
    description = "cidr block for VPC"
    type = list(string) #list of strings
    default = ["10.0.0.0/16", "192.168.0.0/16", "172.16.0.0/12"]
}

variable "allowed_vm_type" {
    description = "instance type"
    type = list(string)
    default = ["t2.micro", "t3.micro", "t2.small"]
}