variable "ec2_count" {
  default = 5
}

resource "aws_instance" "worldbank" {
  ami             = "ami-06878d265978313ca"
  count           = var.ec2_count
  instance_type   = "t2.micro"
  key_name        = "deployer-key" # aws_key_pair.worldbank.key_name
  security_groups = [aws_security_group.worldbank.name]
  tags = {
    name = "TerraformMachine-${count.index}"
  }
}


variable "tags_list" {
  type    = list(string)
  default = ["devops", "hello1", "cm", "iac", "cd"]
}

resource "aws_instance" "resource-from-list" {
  ami             = "ami-06878d265978313ca"
  instance_type   = "t2.micro"
  key_name        = "deployer-key" # aws_key_pair.worldbank.key_name
  security_groups = [aws_security_group.worldbank.name]
  tags = {
    Name = each.value
  }
  for_each = toset(var.tags_list)
}
