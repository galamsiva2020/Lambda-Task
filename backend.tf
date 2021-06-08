terraform {
  backend "s3" {
    # S3 bucket name in which the backend state is stored!
    bucket  = "terraform-prod-state"
    key     = "prod/lambdas/terraform.tfstate"
    region  = "eu-central-1"
    profile = "xxxxxx"
    # The DynamoDB table name created for locking mechanism!
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }
}
