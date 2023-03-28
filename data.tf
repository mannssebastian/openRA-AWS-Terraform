data "template_file" "openra_user_data" {
  template = <<-EOF
              #!/bin/bash
              sudo apt-get -y  update && sudo apt-get -y upgrade
              sudo apt-get -y install libopenal1 mono-runtime libasound2 mono-complete screen
              wget https://github.com/OpenRA/OpenRA/releases/download/release-${var.redalert-release}/OpenRA-Red-Alert-x86_64.AppImage
              chmod +x OpenRA-Red-Alert-x86_64.AppImage
              sudo apt -y install fuse
              ./OpenRA-Red-Alert-x86_64.AppImage --server Server.Name=${var.redalert-server-name} Server.ListenPort=1234 Server.AdvertiseOnline=True Server.Password=${var.redalert-server-pwd} Server.EnableSingleplayer=true
              EOF
}

data "aws_ami" "ubuntu-linux-2204" {
  most_recent = true
  owners      = ["099720109477"] # Canonical
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}