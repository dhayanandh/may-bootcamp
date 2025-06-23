locals {
    lambda_definition = [
        {
            name        = "iam-key-rotation"
            path        = "../lambda/iam-key-rotation"
            handler     = "lambda_function.lambda_handler"
            policy = jsonencode({
                Version = "2012-10-17"
                Statement = [
                    {
                        Action = [
                            "iam:ListAccessKeys",
                        ]
                        Effect   = "Allow"
                        Resource = "*"
                    },
                    {
                        Action = [
                            "ses:SendEmail",
                            "ses:SendRawEmail",
                        ]
                        Effect   = "Allow"
                        Resource = "*"
                    }
                ]
            })
            environments_variables = {
                iam_username = "cliuser-akhilesh"
            }
        },
        {
            name        = "s3-object-sorter"
            path        = "../lambda/s3-object-sorter"
            handler     = "main.handler"
            policy = jsonencode({
                Version = "2012-10-17"
                Statement = [
                    {
                        Action = [
                            "s3:*",
                        ]
                        Effect   = "Allow"
                        Resource = "*"
                    }
                ]
            })
            environments_variables = {
                bucket_name = "anotherdumyybubucket-here-879381241087"
                prefix = "incoming/"
            }
        }
        
    ]
}

