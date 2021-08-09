provider "aws" {
  region = "us-east-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  required_version = "0.14.6"

  # Uncomment this and replace it with your configuration to enable
  # the Terraform S3 backend configuration. Remember that the module
  # `tf-aws-tfstate-s3-dynamodb` would take care of the provisioning of
  # the necessary resources.
#   backend "s3" {
#     region         = "us-east-1"
#     bucket         = "YOUR-BUCKET-NAME"
#     key            = "terraform.tfstate"
#     dynamodb_table = "YOUR-DYNAMODB-NAME-tfstate"
#   }
# }


module "tfstate" {
  source = "../modules/tfstate"

  project_name = "projectname"
  environment  = "env"

  tags = {
    Name    = "name"
    Owner   = "owner-name"
    Project = "project-name"
  }
}

# This outputs would help on the setup of the S3 backend configuration
output "tfstate_bucket_name" {
  value = module.tfstate.s3_bucket_id
}

output "tfstate_dynamodb_table" {
  value = module.tfstate.dynamodb_table_id
}
