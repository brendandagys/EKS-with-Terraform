variable "vpc_name" {
  type = string
  default = "kubernetes-vpc"
}

variable "vpc_cidr_block" {
  type = string
  default = "10.0.0.0/16"
}

variable "vpc_public_subnets" {
  type = list(string)
  default = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "vpc_private_subnets" {
  type = list(string)
  default = ["10.0.128.0/24", "10.0.129.0/24"]
}

variable "single_nat_gateway" {
  type = bool
  default = false
}

variable "environment" {
  type = string
  default = "development"
}
