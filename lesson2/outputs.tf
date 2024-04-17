output "instance_id" {
  value = aws_instance.myinstance.id
  description = "AWS instance name" 
  
}

output "subnets_id" {
    value = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
    description = "AWS subnet1"  
}

output "vpc_id" {
    value = aws_vpc.myVPC.id 
    description = "AWS VPC"
  
}
output "CIDR_ID" {
    value = aws_vpc.myVPC.cidr_block
    description = "AWS_CIDR block"  
}