variable "name_prefix" {
     description = "리소스 이름 접두사"
     type        = string 
     default     = "whs-ecr"
}

variable "tags"        {
     description = "공통 태그"
     type        = map(string)
     default     = {
          Owner  = "whs"
          ManagedBy = "Terraform"
          Project   = "DevSecOps"
     }
}
