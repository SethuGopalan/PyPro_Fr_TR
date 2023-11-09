resource "aws_eks_cluster" "Eks_Dashapp_cluster" {
  name = "my-eks-dashapp-cluster"

  role_arn = aws_iam_role.Eks_Dashapp_cluster.arn

  vpc_config {
    security_group_ids = [ws_security_group.Eks_dashapp_sg.id]
    subnet_ids         = [aws_subnet_ids.default_subnets.id]
  }
}

resource "aws_iam_role" "eks_dash_role" {
  name               = "eks_dash_role"
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

resource "aws_iam_role_policy_attachment" "eks_dash_policy" {
  role       = aws_iam_role.eks_dash_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterFullAccess"
}

