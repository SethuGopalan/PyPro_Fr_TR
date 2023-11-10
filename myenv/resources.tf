resource "aws_eks_cluster" "my-eks-dashapp-cluster" {
  name = "my-eks-dashapp-cluster"

  role_arn = data.aws_iam_role.eks_dashapp_role.arn

  vpc_config {
    security_group_ids = [data.aws_security_group.Eks_dashapp_dock_sg.id]
    subnet_ids         = [data.aws_subnets.default_subnets.id]
  }

  depends_on = [data.aws_iam_role_policy_attachment.eks_dashapp_policy]
}
# resource "aws_subnets" "default_subnets" {

#   filter {

#     #   vpc_id = aws_default_vpc.default.id
#     name = "vpc-id"

#     values = [aws_default_vpc.default.id]
#   }

# }

# resource "aws_iam_role_policy_attachment" "eks_dashapp_policy" {
#   role       = data.aws_iam_role.eks_dashapp_role.arn
#   policy_arn = data.aws_iam_policy.AmazonEKSClusterFullAccess.arn
# }
# resource "aws_security_group_rule" "ingress_http" {

#   type              = "ingress"
#   from_port         = 80
#   to_port           = 80
#   protocol          = "tcp"
#   cidr_blocks       = ["0.0.0.0/0"]
#   security_group_id = data.aws_security_group.Eks_dashapp_dock_sg.id
# }
# resource "aws_security_group_rule" "ingress_port" {

#   type              = "ingress"
#   from_port         = 22
#   to_port           = 22
#   protocol          = "tcp"
#   cidr_blocks       = ["0.0.0.0/0"]
#   security_group_id = data.aws_security_group.Eks_dashapp_dock_sg.id

# }
# resource "aws_security_group_rule" "egress_rule" {
#   type              = "egress"
#   from_port         = 0
#   to_port           = 0
#   protocol          = "-1"
#   cidr_blocks       = ["0.0.0.0/0"]
#   security_group_id = data.aws_security_group.Eks_dashapp_dock_sg.id
# }

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

resource "aws_iam_role_policy_attachment" "eks_dashapp_policy" {
  role       = aws_iam_role.eks_dashapp_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterFullAccess"
}

