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
