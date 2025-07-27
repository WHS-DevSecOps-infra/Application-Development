provider "aws" {
  region = var.aws_region
}

# VPC 모듈 remote_state 참조
data "terraform_remote_state" "vpc" {
  backend = "s3" 
    config = {
      bucket         = "application-team-tfstate-bucket"
      key            = "develop/vpc.tfstate"
      region         = var.aws_region
      dynamodb_table = "terraform-locks"
      encrypt        = true
  }
}

# IAM 모듈 remote_state 참조
data "terraform_remote_state" "iam" {
  backend = "s3" 
    config = {
      bucket         = "application-team-tfstate-bucket"
      key            = "develop/iam.tfstate"
      region         = var.aws_region
      dynamodb_table = "terraform-locks"
      encrypt        = true
  }
}

# EC2 인스턴스 생성
resource "aws_instance" "this" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = data.terraform_remote_state.vpc.outputs.public_subnet_ids[0]
  vpc_security_group_ids      = [data.terraform_remote_state.vpc.outputs.common_sg_id]
  key_name                    = var.key_name
  associate_public_ip_address = true

  iam_instance_profile        = data.terraform_remote_state.iam.outputs.instance_profile_name

  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
  }

  tags = merge(var.tags, { Name = "${var.name_prefix}-instance" })
}