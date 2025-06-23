data "archive_file" "lambda_zip" {
  for_each = local.lambda_info
  type        = "zip"
  source_dir  = "${path.module}/${each.value.path}"
  output_path = "${path.module}/${each.key}.zip"
} 

resource "aws_iam_role" "lambda_role" {
  for_each = local.lambda_info
  name = "${var.prefix}-${var.environment}-${each.key}-role"
  
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  }) 
}

resource "aws_iam_policy" "lambda_policy" {
  for_each = local.lambda_info
  name        = "${var.prefix}-${var.environment}-${each.key}-policy"
  description = "Policy for Lambda function to rotate IAM keys"
  
  policy = each.value.policy
}

resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  for_each = local.lambda_info
  role       = aws_iam_role.lambda_role[each.key].name
  policy_arn = aws_iam_policy.lambda_policy[each.key].arn
}

resource "aws_lambda_function" "my_lambda_function" {
    for_each = local.lambda_info
    function_name    = "${var.prefix}-${var.environment}-${each.key}"
    role             = aws_iam_role.lambda_role[each.key].arn
    handler          = each.value.handler
    runtime          = "python3.13"
    timeout          = 60
    memory_size      = 128

    # Use the Archive data source to zip the code
    filename         = data.archive_file.lambda_zip[each.key].output_path
    source_code_hash = data.archive_file.lambda_zip[each.key].output_base64sha256

    # Define environment variables
    environment {
        variables = each.value.environments_variables
    }
}
