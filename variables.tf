variable "namespace" {}

variable "stage" {}

variable "name" {}

variable "region" {
  description = "AWS region to manage instances in"
}

variable "flavor" {
  default     = "debian-systemd"
  description = "Flavor depends of OS and init system"
}

