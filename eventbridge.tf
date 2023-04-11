resource "aws_scheduler_schedule" "daily_3am" {
  name                = "daily_3am"
  group_name          = "default"
  schedule_expression = "cron(0 3 * * ? *)"
}
