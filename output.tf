output "worldbank_public_IP" {
  # value = aws_instance.worldbank.public_ip
  value = aws_instance.worldbank.*.public_ip
}

output "worldbank_private_IP" {
  # value = aws_instance.worldbank.private_ip
  value = aws_instance.worldbank.*.private_ip
}

output "worldbank_ID" {
  # value = aws_instance.worldbank.id
  value = aws_instance.worldbank.*.id
}