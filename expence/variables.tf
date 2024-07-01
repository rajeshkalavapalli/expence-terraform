# ec2 instance variables 
variable "ami" {
  type = string
  default = "data.aws_ami.expense.id"
}

variable "instance_type" {
  type = string
  default = "t2.small"
}

variable "instance_name" {
  type = list 
  default = [
    "mysql",
    "backend",
    "frontend"
  ]
}

variable "common_tags" {
  type = map
  default = {
    project = "expense"
    environment= "dev"
    terraform =true
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

# sg group

variable "name" {
  type = string
  default = "expense_sg"
}

variable "description" {
  type = string
  default = "allowing all sg for expense"
}

variable "from_port" {
  type = number
  default = 0
}

variable "to_port" {
  type = number
  default = 0
}

variable "protocol" {
  type = string
  default = "-1"
}

variable "cidr_blocks" {
  type = list
  default = ["0.0.0.0/0"]
}

variable "ingress_description" {
  type = string
  default = "allowing all http and https"
}

variable "sg_tag" {
  default = "SG"
}

# route 53 variables 
variable "zone_id" {
  type = string
  default = "Z02400681RG5QICC3BHZN"
}

variable "type" {
  default = "A"
}

variable "domine_name" {
  default = "bigmatrix.in"
}