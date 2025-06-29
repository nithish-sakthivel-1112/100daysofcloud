output "security_group_id" {
    description = "This is my SG group ID"
    value = aws_security_group.my_security_group.id
  
}