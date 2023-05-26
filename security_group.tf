resource "aws_security_group" "sg_to_ec2_instance" {
  name        = local.name
  description = "Generate security group to EC2 Instance"
  vpc_id      = "vpc-00355bd1870c0d3b6"

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${local.name}.sg.diogenes@gmail.com"
  }
}