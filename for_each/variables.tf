variable "instance_names" {
  type        = map
  default     = {
    db = "t3.small"
    backend = "t3.micro"
    frontend = "t3.micro"
  }
}

variable "common_tags" {
    type = map
    default = {
        Project = "Expense"
        Terraform = "true"
    }
}

variable "project_name" {
  type = string
  default = "expense"
}

variable "environment" {
    type = string
    default = "dev"
  
}


# route 53 variables 
variable "zone_id" {
  type = string
  default = "Z02400681RG5QICC3BHZN"
}

variable "type" {
  default = "A"
}

variable "domain_name" {
  default = "bigmatrix.in"
}

