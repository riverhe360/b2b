# ---- this script is for create aws glue catalog database 

#--------- set variable -------------------------------
variable "database_name" {
  type = string
  default = "rhe-b2b-poc-glue-catalog-db-dev"     # for development 
  #default = "rhe-b2b-poc-glue-catalog-db-uat"    # for UAT
  #defalut = "rhe-b2b-poc-glue-catalog-db-prod"   # for production
}

variable "region_name" {
  type = string
  default = "us-east-1"     # for 
  #default = "us-east-2"    # for
  #defalut = "eu-west-1"    # for 
}

variable "db_location" {
  type = string
  default = "s3://360insights-datalake-test/rhe-b2b-poc-bucket/database/"     # for development 
  #default = "s3://360insights-datalake-uat/rhe-b2b-poc-bucket/database/"    # for  uat
  #defalut = "s3://360insights-datalake-prod/rhe-b2b-poc-bucket/database/"    # for  prod
}

variable "db_description" {
  type = string
  default = "rhe b2b glue catalog database at dev"     # for development 
  #default = "rhe b2b glue catalog database at uat"    # for  uat
  #defalut = "rhe b2b glue catalog database at prod"    # for  prod
}


terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  #region = "us-east-1"
  region = var.region_name
}


# Create glue catalog database
resource "aws_glue_catalog_database" "aws_glue_catalog_database" {
  name = var.database_name
  description = var.db_description	
  location_uri = var.db_location
}


