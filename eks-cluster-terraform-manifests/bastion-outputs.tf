output "bastion_id" {
  value = module.ec2_bastion_host.id
}

output "ec2_bastion_elastic_ip" {
  value = aws_eip.bastion_elastic_ip.public_ip
}
