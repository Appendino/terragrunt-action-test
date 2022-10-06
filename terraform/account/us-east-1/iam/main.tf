variable "name" {
    type = string
}
module "iam_account" {
   source = "terraform-aws-modules/iam/aws//modules/iam-user"
   name = var.name
}
