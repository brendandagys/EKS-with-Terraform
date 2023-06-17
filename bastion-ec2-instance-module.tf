module "ec2_bastion_host" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.1.0"

  name = "${local.project}-bastion-host"
  ami = data.aws_ami.amzlinux2.id
  instance_type = var.bastion_instance_type
  create_spot_instance = var.bastion_create_spot_instance
  
  key_name = var.bastion_keypair

  subnet_id = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.public_bastion_security_group.security_group_id]
}
