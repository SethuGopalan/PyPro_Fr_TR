terraform {
  backend "s3" {
    bucket = "eks-dashapp-bucket-001"
    key    = "Kub-dashApp001-dev.tfstate"
    region = "us-east-1"
    # Include additional backend configurations if needed
  }
}
resource "aws_s3_bucket" "dashapp_bucket" {
  bucket = "eks-dashapp-bucket-001"

}

resource "aws_iam_policy" "s3_bucket_access" {
  name        = "S3BucketAccessPolicy"
  description = "Policy to access specific S3 bucket"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject",
          "s3:ListBucket"
        ],
        Effect = "Allow",
        Resource = [
          "${aws_s3_bucket.dashapp_bucket.arn}",
          "${aws_s3_bucket.dashapp_bucket.arn}/*"
        ]
      }
    ]
  })
}

resource "aws_iam_user" "dashapp_bucket_user" {
  name = "dashapp_bucket_user"
}

resource "aws_iam_user_policy_attachment" "example_attach" {
  user       = aws_iam_user.dashapp_bucket_user.name
  policy_arn = aws_iam_policy.s3_bucket_access.arn
}
