
# data "aws_security_group" "Eks_dashapp_dock_sg" {
#   name = "Eks_dashapp_dock_sg"

#   # tags = {
#   #   name = "Eks_dashapp_dock_sg"
#   # }

# }

# data "aws_iam_role" "eks_dashapp_role" {
#   name = "eks_dashapp_role"
# }

# data "aws_iam_policy" "AmazonEKSClusterFullAccess" {
#   name = "AmazonEKSClusterFullAccess"
# }

# data "aws_iam_role_policy_attachment" "eks_dashapp_policy" {
#   role       = data.aws_iam_role.eks_dashapp_role.arn
#   policy_arn = data.aws_iam_policy.AmazonEKSClusterFullAccess.arn
# }


data "aws_subnets" "default_subnets" {

  # vpc_id = aws_default_vpc.default.id
  filter {

    #   vpc_id = aws_default_vpc.default.id
    name = "vpc-id"

    values = [aws_default_vpc.default.id]
  }

  filter {
    name   = "availability-zone"
    values = ["us-east-1a", "us-east-2b", "us-east-2c", "us-east-1d"] # Update with valid zones
  }

}
data "template_file" "aws_auth_configmap" {
  template = file("${path.module}/configmap.tpl")

  vars = {
    eks_dashapp_role_arn = aws_iam_role.eks_dashapp_role.arn
  }
}
