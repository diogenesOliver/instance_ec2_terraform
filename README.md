<h3>Terraform (AWS) - EC2 instance </h3><img height="30" width="40" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/terraform/terraform-original.svg" />
          
<br>

<p>
Colocando em prática alguns conhecimentos de IaC (Infrastructure as Code) utilizando a linguagem Terraform para subir uma instância EC2 na AWS e criar um monitoramento no CloudWatch
</p>

<p>Atualmento o monitoramento da instância EC2 é apenas de utilização de CPU, em breve será criado outros tipos de monitoramento</p>

### Instância EC2

```terraform
module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = local.name

  instance_type          = "t2.micro"
  key_name               = aws_key_pair.key_pair_ec2_instance.key_name
  vpc_security_group_ids = [aws_security_group.sg_to_ec2_instance.id]
  subnet_id              = local.networks[local.environmente].subnet

  tags = {
    Name = "${local.name}.ec2.diogenes@gmail.com"
  }
}
```

### Monitoramento no CW

```terraform
resource "aws_cloudwatch_metric_alarm" "CPUUtilization-ec2" {
  alarm_name          = "[EC2 Instance] - Monitoring CPU Utilization"
  threshold           = 80
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1

  alarm_description = "This monitoring should send a alarm when CPUUtilization of this EC2 instance > 80%"

  metric_query {
    id = "m1"
    return_data = "true"

    metric {
      metric_name = "CPUUtilization"
      namespace   = "AWS/EC2"
      period      = 60
      stat        = "Average"

      dimensions = {
        InstanceId = module.ec2_instance.id 
      }
    }
  }
}

```