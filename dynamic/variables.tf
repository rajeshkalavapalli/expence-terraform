variable "name" {
  type = string
  default = "expense-sg"
}

variable "description" {
  type = string
  default = "Allowing port 22,80,8080,3306 acess"
}

variable "sg_tag" {
type = string
default = "expense"
}

variable "environment" {
  default = "dev"
}
variable "common_tags" {
  type = map 
  default = {
    project ="expence"
    environment= "dev"
    terraform = true
  }
}

variable "inbound_rules" {
  type = list 
  default = [
    {
        from_port   = 22
        protocol    = "tcp"
        allowed_cider = ["0.0.0.0/0"]
    },

    {
        from_port   = 80
        protocol    = "tcp"
        allowed_cider = ["0.0.0.0/0"]
    },

    {
        from_port   = 8080
        protocol    = "tcp"
        allowed_cider = ["0.0.0.0/0"]
    },

    {
        from_port   = 3306
        protocol    = "tcp"
        allowed_cider = ["0.0.0.0/0"]
    }
  ]
}