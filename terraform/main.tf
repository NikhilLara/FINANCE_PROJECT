resource "aws_instance" "banking-server" {
  ami            = "ami-05b10e08d247fb927"
  instance_type  = "t2.micro"
  key_name       = "keypair1"
  vpc_security_group_id = ["sg-075157b3f9c88e507"]
connection {
  type            = "ssh"
  user            = "ec2-user"
  private_key     = file("./keypair1.pem")
  host            = self.public_ip
  }
provisioner "remote-exec" {
  inline = [ "echo 'wait to start the instance'"]
  }
tags = {
  name = "banking-server"
  }
provisioner "local-exec" {
  command = "echo ${aws_instance.banking-server.public_ip} > inventory"
  }
provisioner "local-exec" {
  command = "ansible-playbook /var/lib/jenkins/workspace/Finance/terraform/ansibleplaybook.yml"
  }
}
