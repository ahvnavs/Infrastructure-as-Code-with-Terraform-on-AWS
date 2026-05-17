provider "aws" {
    region = var.default_region
}

resource "aws_instance" "ec2_instance" {
    ami = "ami-0912f71e06545ad88"
    availability_zone = var.availability_zone[0]
    associate_public_ip_address = true
    count = var.instance_count
    #instance_type = var.instance_type[0]
    instance_type = var.default_environment == "localdesk" ? var.instance_type[0] : var.instance_type[1] #conditional_expression
    lifecycle {
        create_before_destroy = true
    }
    monitoring = true
    provider = aws
    region = var.default_region
    tags = var.tags
}

resource "aws_security_group" "ingress_rule" { #dynamic_block
    name = "sg"
    dynamic "ingress" {
        for_each = var.ingress_rules
        content {
            from_port = ingress.value.form_port
            to_port = ingress.value.to_port
            protocol = ingress.value.protocol
            cidr_blocks = ingress.value.cidr_block
            description = ingress.value.description
        }
    }
}

locals {
    all_instance_ids = aws_instance.ec2_instance[*].id #splat_expression
}

output "instances" {
    value = local.all_instance_ids
}
