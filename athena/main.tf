resource "aws_s3_bucket" "acg-lab-1" {
  bucket = "aws-athena-jtreutel-airquality"
}

resource "aws_athena_database" "acg-lab-1" {
  name   = "jtreutel-airquality"
  bucket = "${aws_s3_bucket.acg-lab-1.bucket}"
}
