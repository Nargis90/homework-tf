provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ubuntu" {
  ami           = "ami-080e1f13689e07408"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  subnet_id     = "subnet-0c3dc82285fe3a8e8"

  tags = {
    Name = "Nargis-first"
  }
}

resource "aws_instance" "aws-instance" {
  ami           = "ami-051f8a213df8bc089"
  instance_type = "t3.micro"
  subnet_id     = "subnet-0c3dc82285fe3a8e8" //subnet ID in us-east-1
  availability_zone = "us-east-1a"
  tags = {
    Name = "Nargis-second"
  }
}
resource "aws_instance" "ami-ubuntu1" {
  ami           = "ami-080e1f13689e07408"
  instance_type = "t2.micro"
  subnet_id     = "subnet-0c3dc82285fe3a8e8"
  monitoring = true
  tags = {
    Name = "Nargis-second"
  }
}