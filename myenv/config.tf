



resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "Eks_dashapp_sg" {

  name = "Eks_dashapp_sg"

  vpc_id = aws_default_vpc.default.id
  # where you wnat to allow trafic from
  # http
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  # ssh
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }



  egress {

    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    name = "http_server_sg"
  }

}
