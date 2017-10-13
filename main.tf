# Define composite variables for resources
module "label" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.2.1"
  namespace  = "${var.namespace}"
  name       = "${var.name}"
  stage      = "${var.stage}"
  attributes = ["cloud"]
}

locals {
  template_path = "${path.module}/templates/${var.os}.sh"
}

data "template_file" "default" {
  template = "${file(local.template_path)}"

  vars {
    namespace = "${var.namespace}"
    name      = "${var.name}"
    stage     = "${var.stage}"
    region    = "${var.region}"
  }
}

## IAM Role Policy that allows access to S3
resource "aws_iam_policy" "default" {
  name = "${module.label.id}"

  lifecycle {
    create_before_destroy = true
  }

  policy = "${data.aws_iam_policy_document.default.json}"
}

data "aws_iam_policy_document" "default" {
  statement {
    actions = [
      "ec2:DescribeInstances",
    ]

    effect = "Allow"

    resources = [
      "*",
    ]
  }
}
