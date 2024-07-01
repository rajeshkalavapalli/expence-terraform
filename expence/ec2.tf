# creating ec2 instances 

resource "aws_instance" "expense" {
  count = 3
  ami           = data.aws_ami.expense.id
  instance_type = var.instance_name[count.index] == "mysql" ? "t3.small" : "t2.small"
  vpc_security_group_ids = [aws_security_group.new_ex.id]

 tags = merge(
  var.common_tags,
  {
    Name = "${var.instance_name[count.index]}-${var.project_name}-${var.environment}"
  }
 )
}

# sg creation 

resource "aws_security_group" "new_ex" {
  name        = var.name
  description = var.description

  ingress {
   description = var.ingress_description
   from_port   = var.from_port
   to_port     = var.to_port
   protocol    = var.protocol
   cidr_blocks = var.cidr_blocks
 }

  egress {
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = var.protocol
    cidr_blocks = var.cidr_blocks
  }


  tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-${var.sg_tag}"
    }
  )
}

#creating route 53

resource "aws_route53_record" "expence" {
  count = length(var.instance_name)
  zone_id = var.zone_id
  name    = var.instance_name[count.index] == "frontend" ?  var.domine_name : "${var.instance_name[count.index]}.${var.domine_name}"
  type    = var.type
  ttl     = 1
  records =  var.instance_name[count.index] == "frontend" ? [aws_instance.expense[count.index].public_ip]:[aws_instance.expense[count.index].private_ip]
  #override if already exist
  allow_overwrite = true
}

