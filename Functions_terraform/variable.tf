variable "default_region" {
    description = "default aws region"
    type = string
    default = "ap-south-1"
}

variable "project_01" {
    default = "TESTINTUBE"
}

variable "hello_nigga"{
    default = "hello world"
}

locals {
    format_01 = lower(var.project_01)
}

locals {
    format_02 = upper(replace(var.hello_nigga," ","-"))
}


variable "default_tag" {
    default = {
        "env" = "local"
        "computer" = "laptop"
    }
}

variable "new_tag" {
    default = {
        "escape" = "room"
        "bitch" = "aar"
    }
}

variable "instance_type" {
    default = t4.nigga
    validation {
        condition = can(regex("^t[2-3]\\.", var.instance_type))
        error_message = "it should be t2 or t3"
    }
}

locals {
    config_file_exists = fileexists("./config.json")
    config_data = local.config_file_exists ? jsondecode(file("./config.json")) : {}
}
