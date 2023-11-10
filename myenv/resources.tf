resource "aws_eks_cluster" "Eks_Dashapp_cluster" {
  name = "my-eks-dashapp-cluster"

  role_arn = aws_iam_role.eks_dashapp_role.arn

  vpc_config {
    security_group_ids = [aws_security_group.Eks_dashapp_Dock_sg.id]
    subnet_ids         = [data.aws_subnets.default_subnets.id]
  }
}

resource "aws_iam_role" "eks_dashapp_role" {
  name               = "eks_dashapp_role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}
resource "aws_iam_policy" "AmazonEKSClusterFullAccess" {
  name   = "AmazonEKSClusterFullAccess"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "eks:*",
        "ec2:*",
        "iam:*",
        "s3:*",
        "logs:*",
        "cloudwatch:*"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "eks_dash_policy" {
  role       = aws_iam_role.eks_dashapp_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterFullAccess"
}

