variable "aws_region" {
  type    = string
  default = "ap-northeast-2"
}

variable "name_prefix" {
  type        = string
  default     = "sca"
  description = "인스턴스 이름 접두사"
}

variable "ami_id" {
  type        = string
  description = "Dependency‑Track 설치용 AMI ID"
  default     = "ami-0ca87be4433db3d79"
}

variable "instance_type" {
  type        = string
  default     = "t3.large"
  description = "인스턴스 유형"
}

variable "key_name" {
  type        = string
  default     = "infra-ec2-key"
  description = "SSH 키페어 이름"
}

variable "volume_size" {
  type        = number
  default     = 50
  description = "Root EBS 볼륨 크기 (GiB)"
}

variable "volume_type" {
  type        = string
  default     = "gp3"
  description = "Root EBS 볼륨 유형"
}

variable "tags" {
  type = map(string)
  default = {
    Environment = "dev"
    Project     = "cloudfence"
  }
}
