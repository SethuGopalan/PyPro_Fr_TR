data "aws_subnets" "default_subnets" {

  filter {

    #   vpc_id = aws_default_vpc.default.id
    name = "vpc-id"

    values = [aws_default_vpc.default.id]
  }

}
