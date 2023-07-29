variable "redalert-server-name" {
  type        = string
  description = "Servername displayed in OpenRA"
}

variable "redalert-server-pwd" {
  type        = string
  description = "pwd for OpenRA server"
}

variable "redalert-release" {
  type        = string
  description = "OpenRA Release zb 20230225"
}

variable "aws_profile" {
  type        = string
  description = "used proifle"
}

variable "cidr-vpc" {
  type        = string
  description = "Cidr Block of VPC"
}

variable "cidr-subnet" {
  type        = string
  description = "Cidr Block of Subnet"
}

variable "instance-type" {
  type        = string
  description = "instance type"
}

variable "region" {
  type    = string
  default = "eu-central-1"
}