variable "subnet_id" {}
variable "ami_id" {}
variable "key_name" {}
variable "user_data" {}
variable "iam_instance_profile" {}
variable "security_group_ids" {
  type = list(string)
}

resource "aws_instance" "web" {
  ami                    = "ami-0e35ddab05955cf57"
  instance_type          = "t2.micro"
  subnet_id              = var.subnet_id
  key_name               = var.key_name
  vpc_security_group_ids = var.security_group_ids
  iam_instance_profile   = var.iam_instance_profile
  user_data              = var.user_data

  tags = {
    Name = "WebServer"
  }
}

output "instance_id" {
  value = aws_instance.web.id
}
