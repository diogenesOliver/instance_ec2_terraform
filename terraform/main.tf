provider "aws" {
  region = "us-east-1"

  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
  
  default_tags {
    tags = {
      Name         = local.name
      Environment = local.environment
    }
  }
}

locals {
  name         = "ec2_instance_iac"
  environment = "dev"
  networks = {
    dev = {
      subnet = "subnet-04627c89fe3034bbf"
    }
  }
}

module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "[EC2 Instance] - EC2 instaince from test"

  instance_type          = "t2.micro"
  key_name               = aws_key_pair.key_pair_ec2_instance.key_name
  vpc_security_group_ids = [aws_security_group.sg_to_ec2_instance.id]
  subnet_id              = local.networks[local.environment].subnet

  tags = {
    Name = "${local.name}.ec2.diogenes@gmail.com"
  }
}
