data "archive_file" "lambda_placeholder" {
  type        = "zip"
  output_path = "placeholder.zip"

  source_dir = "../../placeholders/${var.runtime}"
}

locals {
  source = {
    "python3.7"  = "../../placeholders/python3.7/"
  }
}
