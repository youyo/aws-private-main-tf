resource "aws_s3_bucket" "terraform-tfstate-private-main" {
  bucket = "terraform-tfstate-private-main"
  acl    = "private"
  region = "${var.aws_region}"

  versioning {
    enabled = true
  }

  lifecycle_rule {
    id = "remove versioninged file"

    prefix  = ""
    enabled = true

    noncurrent_version_expiration {
      days = 90
    }
  }
}

resource "aws_s3_bucket" "aws-private-main-logs" {
  bucket = "private-main-logs"
  acl    = "log-delivery-write"
  policy = "${file("policies/log_bucket.json")}"

  lifecycle_rule {
    id      = "remove old log files"
    prefix  = ""
    enabled = true

    expiration {
      days = 90
    }
  }
}
