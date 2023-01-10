output "worldbank_public_IP" {
  # value = aws_instance.worldbank.public_ip
  value = aws_instance.worldbank*.public_ip
}