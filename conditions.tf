variable "allowed" {
  type = bool
  default = false
}

resource "aws_instance" "conditional" {
  count           = var.allowed	? 1 : 0
  ami             = "ami-06878d265978313ca"
  instance_type   = "t2.micro"
  key_name        = "deployer-key" # aws_key_pair.worldbank.key_name
  security_groups = [aws_security_group.worldbank.name]
}
