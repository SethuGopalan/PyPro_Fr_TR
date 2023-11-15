terraform {
  backend "s3" {
    bucket = "eks-dashapp-bucket-001"
    key    = "Kub-dashApp001-dev.tfstate"
    region = "us-east-1"
    # Include additional backend configurations if needed
  }
}
