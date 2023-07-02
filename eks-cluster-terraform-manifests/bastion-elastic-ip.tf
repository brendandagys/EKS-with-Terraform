# resource "aws_eip" "bastion_elastic_ip" {
#   depends_on = [ module.ec2_bastion_host, module.vpc ]
#   instance = module.ec2_bastion_host.spot_instance_id
#   domain = "vpc"
#   tags = local.common_tags
# }
