# RDS Module - Creates MySQL RDS instance with security groups

# Security group for RDS
resource "aws_security_group" "rds" {
  name_prefix = "${var.environment}-rds-sg"
  vpc_id      = var.vpc_id

  # MySQL access
  ingress {
    description = "MySQL"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = var.allowed_db_cidrs
  }

  tags = {
    Name        = "${var.environment}-rds-sg"
    Environment = var.environment
    Owner       = var.owner
  }
}

# DB subnet group
resource "aws_db_subnet_group" "main" {
  name       = "${var.environment}-db-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name        = "${var.environment}-db-subnet-group"
    Environment = var.environment
    Owner       = var.owner
  }
}

# RDS MySQL Instance
resource "aws_db_instance" "main" {
  identifier = "${var.environment}-mysql-db"

  # Engine configuration
  engine         = var.db_engine
  engine_version = var.db_engine_version
  instance_class = var.db_instance_class

  # Database configuration
  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  # Storage configuration
  allocated_storage = var.db_allocated_storage

  # Network configuration
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  publicly_accessible   = var.db_publicly_accessible

  # Skip final snapshot for development
  skip_final_snapshot = true

  tags = {
    Name        = "${var.environment}-mysql-db"
    Environment = var.environment
    Owner       = var.owner
  }
}
