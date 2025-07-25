terraform {
  backend "s3" {
    bucket         = "application-team-tfstate-bucket"
    key            = "codedeploy/terraform.tfstate"
    region         = "ap-northeast-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
