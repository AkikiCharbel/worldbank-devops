variable "allowed_ip" {
  default = "0.0.0.0/0"
}

variable "sg_tag" {
  default = "allow_all"
}

resource "aws_security_group" "worldbank" {
  description = "A SG with relaxed permissions. Everyone is allowed to peek in"

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.allowed_ip]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = var.sg_tag
  }
}