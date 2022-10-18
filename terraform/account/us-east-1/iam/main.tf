variable "name" {
    type = string
}
module "iam_account" {
   source = "terraform-aws-modules/iam/aws//modules/iam-user"
   version = "5.4.0"
   name = var.name
}
