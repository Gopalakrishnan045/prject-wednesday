variable "instance_id" {}
variable "alarm_name" {}
variable "threshold" {
  default = 80
}

resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          = "wednesday"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = var.threshold
  alarm_description   = "This alarm triggers when CPU usage is above threshold"
  dimensions = {
    InstanceId = var.instance_id
  }
}