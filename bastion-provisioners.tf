resource "null_resource" "copy_ec2_keys" {
  depends_on = [module.ec2_bastion_host]
  connection {
    type = "ssh"
    host = aws_eip.bastion_elastic_ip.public_ip
    user = "ec2-user"
    password = ""
    private_key = file("private-key/eks-terraform-key.pem")
  }

  provisioner "file" {
    source = "private-key/eks-terraform-key.pem"
    destination = "/tmp/eks-terraform-key.pem"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/eks-terraform-key.pem"
    ]
  }

  provisioner "local-exec" {
    command = "echo VPC created on `date` - VPC ID: ${module.vpc.vpc_id} >> creation-time-vpc-id.txt"
    working_dir = "local-exec-output-files/"
  }
}

