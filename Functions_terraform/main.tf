provider "aws" {
    region = var.default_region
}

output "formatted_name_01" {
    value = local.format_01
}

output "formatted_name_02" {
    value = local.format_02
}

resource "aws_s3_bucket" "bucket01" {
    bucket = "niggasinghji"
    tags = merge(var.default_tag,var.new_tag)
}
