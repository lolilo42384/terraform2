provider "aws" {
  region = "us-east-1"
}

variable "vpc_id" {
  default = "vpc-03a9fe9963aea016e"
}

variable "subnet_id" {
  default = "subnet-0fefe227dcd838fe9"
}

resource "aws_ecr_repository" "app_repo" {
  name = "fastapi-app-repo"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "fastapi-app-repo"
  }

  lifecycle {
    prevent_destroy = true
    ignore_changes  = [image_scanning_configuration]
  }
}

resource "aws_ecs_cluster" "main" {
  name = "fastapi-cluster"
}
