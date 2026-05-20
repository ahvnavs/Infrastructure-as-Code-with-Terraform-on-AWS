data "aws_vpc" "selected" {
    filter {
        name = "tag:Name"
        values = ["default"]
    }
}

data "aws_subnet" "shared" {
    filter {
        name = "tag:Name"
        values = ["default"]
    }
    vpc_id = data.aws_vpc.selected
}

data "aws_ami" "ec2_ami" {
    most_recent = true
    owners = ["amazon"]
    filter {
        name = "name"
        values = [""]
    }
    filter {
        name = "v_type"
        values = ["hvm"]
    }
    name_regex = []
}
