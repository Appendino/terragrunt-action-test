include {
  path = find_in_parent_folders("common_terragrunt.hcl")
}

generate "backend" {
  path = "overwrite_backend.tf"
  if_exists = "overwrite"
  contents = <<-EOF
    terraform {
      backend "s3" {}
    }
  EOF
}

inputs = {
  name = "bucetao"
}
