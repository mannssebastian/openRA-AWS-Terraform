# resource "aws_key_pair" "openredalert_keypair" {
#   key_name   = "openredalert_keypair"
#   public_key = file("~/.ssh/id_rsa.pub")
# }


resource "aws_instance" "openredalert_instance" {
  ami           = data.aws_ami.ubuntu-linux-2204.id
  instance_type = "t2.micro"

  associate_public_ip_address = true
  subnet_id                   = aws_subnet.openredalert_subnet.id
  vpc_security_group_ids      = [aws_security_group.openredalert_sg.id]
  user_data                   = data.template_file.openra_user_data.rendered

  tags = {
    Name = "OpenRedAlertServer"
  }
}

output "open_ra_pub_ip" {
  value = aws_instance.openredalert_instance.public_ip
}