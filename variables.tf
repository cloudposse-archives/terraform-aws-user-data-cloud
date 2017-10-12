variable "namespace" {}

variable "stage" {}

variable "name" {}

variable "region" {
  description = "AWS region to manage instances in"
}

variable "os" {
  default = "ubuntu"
  description = "Server OS that will execute user data script"
}
