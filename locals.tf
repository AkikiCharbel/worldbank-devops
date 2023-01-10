locals "my_var" {
  tag = "helloThere"
  type = "t2.micro"
  ami = "ami-06878d265978313ca"
}

resource "aws_instance" "fromLocal" {
  ami = local.ami
  instance_type = local.type
}