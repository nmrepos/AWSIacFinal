# EC2 Module - Creates EC2 instances in public subnets with SSH access

# Security group for EC2 instances
resource "aws_security_group" "ec2" {
  name_prefix = "${var.environment}-ec2-sg"
  vpc_id      = var.vpc_id

  # SSH access
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ssh_cidrs
  }

  # All outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.environment}-ec2-sg"
    Environment = var.environment
    Owner       = var.owner
  }
}

# EC2 instances
resource "aws_instance" "main" {
  count                  = length(var.public_subnet_ids)
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name              = var.key_pair_name != "" ? var.key_pair_name : null
  vpc_security_group_ids = [aws_security_group.ec2.id]
  subnet_id             = var.public_subnet_ids[count.index]
  
  associate_public_ip_address = var.enable_public_ip

  tags = {
    Name        = "${var.environment}-ec2-${count.index + 1}"
    Environment = var.environment
    Owner       = var.owner
  }
}
