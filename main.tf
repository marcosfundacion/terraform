data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }


  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
 
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id = "subnet-0b57ecda55d5312e4"
  security_groups = ["sg-00ec8fbcfb0ef2a34", aws_security_group.prueba.id]
  root_block_device {
    volume_size = 10
    volume_type = "gp3"
    encrypted = true

  }
  #vpc-08b1b053d7a483a2e
  tags = {
    Name = "HelloWorld2"
  }
}


resource "aws_security_group" "prueba" {
  name = "sg-prueba-checkmarx"
  description = "prueba"
  
 ingress {
    from_port        = 22
    to_port          = 22
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

