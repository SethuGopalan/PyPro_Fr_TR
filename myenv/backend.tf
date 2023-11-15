terraform {
  backend "s3" {
    bucket = "octopusmsiinstaller"
    key    = "Kub-dashApp001-dev.tfstate"
    region = "us-east-1"
    # Include additional backend configurations if needed
  }
}
