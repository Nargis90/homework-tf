provider "aws" {
  region = "us-east-1"
}
provider "aws" {
  alias = "Oregon"
  region = "us-west-2"
}
resource "aws_vpc" "myVPC" {
  cidr_block       = "10.0.0.0/16"
  }
  resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.myVPC.id

  tags = {
    Name = "main"
  }
}
resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.myVPC.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  depends_on = [aws_internet_gateway.gw]
  }
resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.myVPC.id
  cidr_block = "10.0.2.0/24"
  depends_on = [ aws_vpc.myVPC ]
  
  }
  
data "aws_ami" "ami-oregon" {
  most_recent      = true
  owners           = ["137112412989"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.4.20240401.1-kernel-6.1-x86_64"]
  }
}
data "aws_ami" "ami" {
  most_recent      = true
  owners           = ["137112412989"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.4.20240401.1-kernel-6.1-x86_64"]
  }
}
resource "aws_instance" "inst-private" {
  ami           = data.aws_ami.ami.id
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.subnet2.id
  depends_on = [ aws_subnet.subnet2 ]
  #kjkj
}

resource "aws_instance" "inst-oregon" {
  ami           = data.aws_ami.ami-oregon.id
  provider = aws.Oregon
  instance_type = "t3.micro"
  depends_on = [ aws_instance.inst-private ]
  
}

