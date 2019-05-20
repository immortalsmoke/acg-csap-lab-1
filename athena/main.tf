resource "aws_s3_bucket" "athena_query_results_bucket" {
  bucket = "${var.athena_query_results_bucket}"
  force_destroy = true
}

resource "aws_s3_bucket" "acg-lab-1" {
  bucket = "aws-athena-jtreutel-airquality"
  force_destroy = true
}


resource "aws_athena_database" "acg-lab-1" {
  name   = "jtreutel_airquality"
  bucket = "${aws_s3_bucket.acg-lab-1.bucket}"
}

resource "aws_athena_named_query" "create_air_quality_table" {
  name     = "acglab1_create_air_quality_table"
  database = "${aws_athena_database.acg-lab-1.name}"
  query    = "${file("${path.cwd}/queries/create_air_quality_table.sql")}"
}

resource "aws_athena_named_query" "create_o3_view" {
  name     = "acglab1_create_o3_view"
  database = "${aws_athena_database.acg-lab-1.name}"
  query    = "${file("${path.cwd}/queries/create_o3_view.sql")}"
}

resource "aws_athena_named_query" "solutions" {
  name     = "acglab1_create_o3_view"
  database = "${aws_athena_database.acg-lab-1.name}"
  query    = "${file("${path.cwd}/queries/create_o3_view.sql")}"
}

