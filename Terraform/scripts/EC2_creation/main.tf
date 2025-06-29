resource "aws_instance" "ec2_instance_creation" {
    ami = "ami-0900588ae829985de"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.my_security_group.id]
    key_name = aws_key_pair.public_key.key_name

    tags = {
      name = var.ec2_instance_name
    }
}

resource "tls_private_key" "my_private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "public_key" {
    key_name = "mykey"
    public_key = tls_private_key.my_private_key.public_key_openssh
}

resource "aws_security_group" "my_security_group" {
    name = var.sg_name
}
resource "aws_vpc_security_group_ingress_rule" "sshfromyIp" {
  security_group_id = aws_security_group.my_security_group.id
  cidr_ipv4         = "${chomp(data.http.myip.response_body)}/32"  
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.my_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_outbound_ipv4" {
  security_group_id = aws_security_group.my_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # -1 for all incoming protocols
}

resource "aws_vpc_security_group_egress_rule" "allow_all_outbound_ipv6" {
  security_group_id = aws_security_group.my_security_group.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # -1 for all incoming protocols
}