provider "aws" {
  region = "us-west-2"
}

resource "aws_key_pair" "minecraft" {
  key_name   = "minecraft"
  public_key = file("/Users/preston/.ssh/minecraft.pub")
}

resource "aws_security_group" "minecraft_sg" {
  name        = "minecraft_sg"
  description = "Security group for Minecraft server"
  
  ingress {
    from_port   = 22  # SSH port
    to_port     = 22  # SSH port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH access from all IP addresses
  }

  ingress {
    from_port   = 25565
    to_port     = 25565
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "minecraft" {
  ami           = "ami-0cf2b4e024cdb6960" # Ubuntu Server 24.04 LTS (HVM), SSD Volume Type
  instance_type = "t2.medium"
  key_name      = aws_key_pair.minecraft.key_name

  security_groups = [aws_security_group.minecraft_sg.name]

  tags = {
    Name = "Minecraft Server"
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} > public_ip.txt"
  }

  provisioner "local-exec" {
    command = <<EOT
      #!/bin/bash
      echo "${self.public_ip}" > public_ip.txt
      ./populate_hosts.sh
    EOT
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("/Users/preston/.ssh/minecraft")
    host        = self.public_ip
  }
  
}

