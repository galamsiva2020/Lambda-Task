provider "aws" {
  region  = "eu-central-1"
  profile = "xxxxxx"
}

module "lambda" {
  source        = "../../"
  description   = "Hello world AWS Lambda using python"
  filename      = "../../placeholder.zip"
  function_name = "terraform_lambba_example"
  handler       = "index.handler"
  runtime       = "python3.7"
}
