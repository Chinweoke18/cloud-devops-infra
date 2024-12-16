#create S3 backend
resource "aws_s3_bucket" "s3_backend" {
    bucket = var.bucket_name
   # acl    = "private"

    lifecycle {
        prevent_destroy = true
     }

    # versioning {
    #     enabled = true
    # }

    tags = {
        name = "tf-state-bucket"
     }
}

resource "aws_dynamodb_table" "tf-state-table" {
    name     = var.dynamodb_table_name
    hash_key = "LockID"
    read_capacity = "8"
    write_capacity = "8"

    attribute {
        name = "LockID"
        type = "S"
    }

    tags = {
        name = "tf-state-lock-table"
     }
    
    depends_on = [aws_s3_bucket.s3_backend]
}

output "s3_state_bucket" {
  value = aws_s3_bucket.s3_backend.bucket
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.tf-state-table.name
}