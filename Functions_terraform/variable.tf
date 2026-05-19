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
