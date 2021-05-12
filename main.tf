terraform {
  required_version = ">= 0.15.0"
}

provider "aws" {
  region = var.region
}

variable "region" {
  type    = string
  default = "ap-northeast-1"
}
variable "image_metabase" {
  type    = string
  default = "metabase/metabase:latest"
}
variable "task_role_arn" {
  type = string
}
