# checkov:skip=CKV_TF_*
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
# checkov:skip=CKV_TF_*
resource "aws_instance" "web" {
  # checkov:skip=CKV_TF_*
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id = "subnet-0b57ecda55d5312e4"
  security_groups = "sg-00ec8fbcfb0ef2a34"
  #vpc-08b1b053d7a483a2e
  tags = {
    Name = "HelloWorld"
  }
}