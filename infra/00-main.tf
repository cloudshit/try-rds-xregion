terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    tls = {
      source = "hashicorp/tls"
      version = "4.0.4"
    }

    local = {
      source = "hashicorp/local"
      version = "2.4.0"
    }
  }
}

provider "aws" {
  alias = "seoul"
  region = "ap-northeast-2"
  profile = "default"
}

provider "aws" {
  alias = "tokyo"
  region = "ap-northeast-1"
  profile = "default"
}

provider "tls" {
}

provider "local" {
}

module "seoul" {
  source = "./seoul"
  global_cluster_id = aws_rds_global_cluster.global.id
  providers = {
    aws = aws.seoul
    tls = tls
    local = local
  }
}

module "tokyo" {
  source = "./tokyo"
  global_cluster_id = aws_rds_global_cluster.global.id
  providers = {
    aws = aws.tokyo
    tls = tls
    local = local
  }
}
