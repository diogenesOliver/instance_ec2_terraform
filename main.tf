provider "aws" {
    region = "us-east-1"
    version = "~> 4.0"

    default_tags {
      Name          =       local.name
      Environmente  =       local.environmente
      Service       =       locals.service
    }
}

locals{
    name           =    "ec2_instance_iac"
    environmente   =    "dev"
    service        =    "ec2_instance"
}

module "ec2_instance" {
    source                 =     "terraform-aws-modules/ec2-instance/aws"

    name                   =     local.name

    instance_type          =     "t2.micro"
    key_name               =     aws_key_pair.key_pair_ec2_instance.key_name
    vpc_security_group_ids =     [aws_security_group.sg_to_ec2_instance.id]
    subnet_id              =     "subnet-04627c89fe3034bbf" 

    tags = {
        Name = "${local.name}.ec2.diogenes@gmail.com"
    }
}