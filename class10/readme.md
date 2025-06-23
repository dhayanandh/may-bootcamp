1. we create an lambda with python ruuntime
2. uploaded our code
3. iam role -> permission to get iam user access keys, and send email
4. we executed lambda -> it found the older access keys and sent the email to user 



# terraform implementationss

-> package the code in zip file
-> iam policy with access to iam access keys, and ses permissions
-> we will create a IAM role and attach the policies
-> build lambad with terraform
-> create one cron job and -> to lambda

