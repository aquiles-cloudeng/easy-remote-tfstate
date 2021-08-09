locals {
  region = var.append_region_to_name == true ? var.region : ""
  name = "terraform-${join(
    "-",
    distinct(compact([var.project_name, var.environment, local.region])),
  )}-tfstate"
}

resource "aws_s3_bucket" "default" {
  bucket        = local.name
  acl           = var.acl
  force_destroy = var.force_destroy

  versioning {
    enabled    = true
    mfa_delete = var.mfa_delete
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  lifecycle {
    prevent_destroy = true
  }

  tags = var.tags
}

resource "aws_dynamodb_table" "default" {
  name           = "${local.name}-lock"
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  server_side_encryption {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }

  tags = var.tags
}
