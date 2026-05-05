File Structure in Terraform Project:

main.tf - All Resources Defination
variables.tf - Declare all input variables
outputs.tf - Define what info to display after terraform apply
versions.tf - Lock terraform provider version for consistency
providers.tf - configure cloud provider settings
backend.tf - configure where terraform stores state files

terraform.tfvars - actual value of environment (don't push in git)
terraform.tfvars.example - template (can be pushed)
git test