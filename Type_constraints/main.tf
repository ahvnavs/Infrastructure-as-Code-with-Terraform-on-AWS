provider "aws" {
    #region = var.defaultregion
    region = var.config.region
}

resource "aws_instance" "ec2_instance" {
    count = var.defaultcount
    monitoring = var.monotoring_enabled
    associate_public_ip_address = var.associate_public_ip
    security_groups = allow_tls
    instance_type = var.allowed_vm_type[2]
}

resource "aws_security_group" "allow_tls" {
    name = "allow_tls"
    description = "allow inbound and outbound traffic"
}

resource "aws_vpc_security_group_ingress_rule" "ingressrules_ipv4" {
    security_group_id = aws_security_group.allow_tls.id
    cidr_ipv4 = var.cidr_block[1]
    from_port = 443
    ip_protocol = "tcp"
    to_port = 443
}

resource "aws_vpc_security_group_egress_rule" "egressrules_ipv4" {
    security_group_id = aws_security_group.allow_tls.id
    cidr_ipv4 = "0.0.0.0/0"
    ip_protocol = "-1"
}
