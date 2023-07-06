resource "aws_cloudwatch_metric_alarm" "CPUUtilization-ec2" {
  alarm_name          = "[EC2 Instance] - Monitoring CPU Utilization"
  comparison_operator = "GreaterThanThreshold"
  threshold           = 80
  evaluation_periods  = 1
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  metric_name         = "CPUUtilization"
  alarm_description   = "This monitoring should send a alarm when CPUUtilization of this EC2 instance > 80%"
}
