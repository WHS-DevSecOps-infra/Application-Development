variable "name_prefix" {
  type        = string
  description = "리소스 이름 접두사"
  default     = "whs-vpc"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR 블록"
  default     = "100.0.0.0/16"
}

variable "public_subnets_cidr" {
  type        = map(string)
  description = "퍼블릭 서브넷 CIDR 목록"
  default     = {
    0 = "100.0.1.0/24"
    1 = "100.0.2.0/24"
  }
}

variable "azs" {
  type        = map(string)
  description = "서브넷별 AZ 목록"
  default     = {
    0 = "ap-northeast-2a"
    1 = "ap-northeast-2b"
  }
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "공통 태그"
}

# ─── 공통 SG를 위한 변수 ───
variable "ssh_port" {
  type        = number
  default     = 22
  description = "허용할 SSH 포트"
}

variable "app_ports" {
  type        = list(number)
  default     = [443, 8080, 9000, 8090]
  description = "허용할 애플리케이션 포트 목록"
}
