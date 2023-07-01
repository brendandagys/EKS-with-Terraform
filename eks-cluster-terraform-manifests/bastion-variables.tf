variable "bastion_instance_type" {
  type = string
  default = "t3.micro"
}

variable "bastion_create_spot_instance" {
  type = bool
  default = true
}

variable "bastion_keypair" {
  type = string
  default = "eks-terraform-key"
}

