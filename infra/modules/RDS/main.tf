# resource "aws_db_instance" "this" {
#   identifier              = var.db_identifier
#   engine                 = var.engine
#   instance_class         = var.instance_class
#   allocated_storage       = var.allocated_storage
#   username               = var.username
#   password               = var.password
#   db_name                = var.db_name
#   vpc_security_group_ids  = var.vpc_security_group_ids
#   skip_final_snapshot    = true 

#   tags = {
#     Name = var.db_identifier
#   }
# }

# resource "aws_db_subnet_group" "this" {
#   name       = "${var.db_identifier}-subnet-group"
#   subnet_ids = var.subnet_ids

#   tags = {
#     Name = "${var.db_identifier}-subnet-group"
#   }
# }
