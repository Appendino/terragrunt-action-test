remote_state {
  backend = "s3"
  config = {
    bucket = "terrarunt-bucket-bucetao"
    key = "${path_relative_to_include()}/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    dynamodb_table = "terrarunt-bucket-bucetao-lock"
  }
}
