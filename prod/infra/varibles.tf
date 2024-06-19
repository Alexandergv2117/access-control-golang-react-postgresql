variable "access_key" {
  type        = string
  description = "AWS access key"
}

variable "secret_key" {
  type        = string
  description = "AWS secret key"
}

variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "EC2 instance type"
}

variable "key_name" {
  type        = string
  default     = "blackwell"
  description = "EC key pair name"
}

variable "server_name" {
  type        = string
  default     = "access_controll_prod"
  description = "Name of the server instance"
}

variable "db_instance_type" {
  type        = string
  default     = "db.t3.micro"
  description = "Database instance type"
}

variable "db_username" {
  type        = string
  default     = "postgres"
  description = "Database username"
}

variable "db_password" {
  type        = string
  default     = "password"
  description = "Database password"
}

variable "db_name" {
  type        = string
  default     = "access_controll_db_prod_postgres"
  description = "Database name"
}

variable "db_port" {
  type        = number
  default     = 5432
  description = "Database port"
}

variable "secret_manager_name" {
  type        = string
  default     = "access_controll_prod_secret"
  description = "Name of the secret manager"
}
