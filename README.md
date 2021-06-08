# AWS Lambda Terraform module

## Terraform version compatibility

| module | terraform |     branch      |
| :----: | :-------: | :-------------: |
| 4.x.x  |  0.12.x   |     master      |
| 3.x.x  |  0.11.x   | terraform_0.11x |

## How do I use this module?

In general configure the Lambda function with all required variables 
```
provider "aws" {
  region = "eu-west-1"
}

module "lambda" {
  source        = "spring-media/lambda/aws"
  version       = "4.3.0"
  filename      = "my-package.zip"
  function_name = "my-function"
  handler       = "my-handler"
  runtime       = "nodejs8.10"

  // configurable event trigger, see examples
  event = {
    type                = "cloudwatch-scheduled-event"
    schedule_expression = "rate(1 minute)"
  }

  // optionally set environment configuration
  environment = {
    variables {
      loglevel = "INFO"
    }
  }

  // optionally enable VPC access
  vpc_config = {
    security_group_ids = ["sg-1"]
    subnet_ids         = ["subnet-1", "subnet-2"]
  }

  # optionally configure Parameter Store access with decryption
  ssm_parameter_names = ["some/config/root/*"]
  kms_key_arn         = "arn:aws:kms:eu-west-1:647379381847:key/f79f2b-04684-4ad9-f9de8a-79d72f"

  # optionally create a log subscription for streaming log events from CloudWatch to ElasticSearch
  logfilter_destination_arn = "arn:aws:lambda:eu-west-1:647379381847:function:cloudwatch_logs_to_es_production"
}
