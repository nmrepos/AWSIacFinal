# S3 Module
module "s3_buckets" {
  source = "./modules/s3"
  
  bucket_names       = var.s3_bucket_names
  enable_versioning  = var.enable_s3_versioning
  environment        = var.environment
  owner             = var.owner
}

# VPC Module
module "vpc" {
  source = "./modules/vpc"
  
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
  environment          = var.environment
  owner               = var.owner
}

# EC2 Module
module "ec2" {
  source = "./modules/ec2"
  
  vpc_id               = module.vpc.vpc_id
  public_subnet_ids    = module.vpc.public_subnet_ids
  instance_type        = var.instance_type
  ami_id              = var.ami_id
  key_pair_name       = var.key_pair_name
  enable_public_ip    = var.enable_public_ip
  allowed_ssh_cidrs   = var.allowed_ssh_cidrs
  environment         = var.environment
  owner              = var.owner
}

# RDS Module  
module "rds" {
  source = "./modules/rds"
  
  vpc_id                 = module.vpc.vpc_id
  private_subnet_ids     = module.vpc.private_subnet_ids
  db_instance_class      = var.db_instance_class
  db_engine             = var.db_engine
  db_engine_version     = var.db_engine_version
  db_name               = var.db_name
  db_username           = var.db_username
  db_password           = var.db_password
  db_allocated_storage  = var.db_allocated_storage
  db_publicly_accessible = var.db_publicly_accessible
  allowed_db_cidrs      = var.allowed_db_cidrs
  environment           = var.environment
  owner                = var.owner
}
