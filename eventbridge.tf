resource "aws_scheduler_schedule" "daily_3am" {
  name                = "daily_3am"
  group_name          = "default"
  schedule_expression = "cron(0 3 * * ? *)"
  target {
    arn = "arn:aws:lambda:eu-west-2:535487841971:function:test"
  }
}
