data "aws_iam_policy_document" "s3_data_bucket_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.env-bucket.arn}/${var.env_file}"]
  }
  statement {
    actions   = ["s3:GetBucketLocation"]
    resources = ["${aws_s3_bucket.env-bucket.arn}"]
  }
}

resource "aws_iam_policy" "pull_env_from_s3_policy" {
  name   = "pull_env_from_s3_policy"
  path   = "/"
  policy = data.aws_iam_policy_document.s3_data_bucket_policy.json
}

resource "aws_iam_role_policy_attachment" "ecs_role_s3_data_bucket_policy_attach" {
  role       = module.ecs-service-fargate.task_exec_role_name
  policy_arn = aws_iam_policy.pull_env_from_s3_policy.arn
}
