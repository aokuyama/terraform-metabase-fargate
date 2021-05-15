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

variable "timezone" {
  type    = string
  default = "Asia/Tokyo"
}

variable "hostzone_name" {
  type = string
}
variable "host_metabase" {
  type = string
}

variable "cert_arn" {
  type = string
}

variable "cidr_vpc" {
  default = "10.1.0.0/16"
}

variable "cidr_subnet" {
  type = map(string)

  default = {
    a = "10.1.0.0/24"
    c = "10.1.16.0/24"
    d = "10.1.32.0/24"
  }
}

variable "image_metabase" {
  type    = string
  default = "metabase/metabase:latest"
}
variable "task_role_arn" {
  type = string
}

variable "container-metabase" {
  default = "container-metabase"
}

variable "mb_db_type" {
  type = string
}
variable "mb_db_name" {
  type = string
}
variable "mb_db_port" {
  type = string
}
variable "mb_db_user" {
  type = string
}
variable "mb_db_host" {
  type = string
}

variable "tools_allow_cidrs" {
  type = list(string)
  default = [
    "0.0.0.0/0",
  ]
}
