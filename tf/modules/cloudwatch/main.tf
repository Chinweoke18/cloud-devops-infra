resource "aws_cloudwatch_log_group" "cb_log_group" {
  name              =  var.log_grp
  retention_in_days = 30

  tags = {
    Name = "cloud-devops-log"
  }
}
 
# resource "aws_cloudwatch_log_stream" "cb_log_stream" {
#   name           = var.log_stream
#   log_group_name = aws_cloudwatch_log_group.cb_log_group.name
# }