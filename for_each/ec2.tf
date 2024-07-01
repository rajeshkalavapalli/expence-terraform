# creating ec2 instances 

resource "aws_instance" "expense" {
  for_each = var.instance_names
  ami           = data.aws_ami.expense.id
  instance_type = each.value
  vpc_security_group_ids = ["sg-0eb76be1cde1473e6"]

 tags = merge(
  var.common_tags,
  {
    Name = each.key
  }
 )
}