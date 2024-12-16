resource "aws_cloudwatch_log_group" "cb_log_group" {
  name              =  var.log_grp
  retention_in_days = 30

  tags = {
    Name = "cloud-devops-log"
  }
}
 
