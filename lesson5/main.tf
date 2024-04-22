provider "aws" {
    region = "us-east-1"
 }
locals {
  instance_names=["first","second"]
}
resource "aws_vpc" "myVPC" {
  cidr_block       = "10.0.0.0/16"
  }
    
resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.myVPC.id
  cidr_block = "10.0.1.0/24"
  
  }
 resource "aws_instance" "instances" {
    count = 2
  ami           = data.aws_ami.ami.id
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.subnet1.id
  
  tags = {
    "Name" = "instance-${local.instance_names[count.index]}"
  }
}