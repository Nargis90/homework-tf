provider "aws" {
  region = "us-east-1"
}
resource "aws_vpc" "myVPC" {
  cidr_block       = "10.0.0.0/16"
  }

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.myVPC.id
  cidr_block = "10.0.1.0/24"
  }

resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.myVPC.id
  cidr_block = "10.0.2.0/24"
  }


data "aws_ami" "ami" {
  most_recent      = true
  owners           = ["137112412989"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.4.20240401.1-kernel-6.1-x86_64"]
  }
}
resource "aws_instance" "myinstance" {
  ami           = data.aws_ami.ami.id
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.subnet2.id
}

