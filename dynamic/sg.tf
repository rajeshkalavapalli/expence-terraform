resource "aws_security_group" "expense_sg" {
  name        = var.name
  description = var.description
#   vpc_id      = aws_vpc.main.id

  
 dynamic   "ingress" {
    for_each = var.inbound_rules
    content {
        description = "HTTPS ingress"
        from_port   = ingress.value["from_port"]
        to_port     = ingress.value["from_port"]
        protocol    = ingress.value["protocol"]
        cidr_blocks = ingress.value["allowed_cider"]
    }
}

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }



  tags = merge(
    var.common_tags,
    {
        Name= "${var.sg_tag}-${var.environment}"
    }
  )
}