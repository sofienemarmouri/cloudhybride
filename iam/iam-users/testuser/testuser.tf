provider "aws" {
  access_key = "xxxxxxxxxxx"
  secret_key = "xxxxxxxxxxxxxxxxx"
  region     = "eu-west-3"
}

resource "aws_iam_user_policy" "testuser" {
  name = "testuser-policy"
  user = aws_iam_user.testuser.name

  #AmazonEC2ReadOnlyAccess
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [

        {
            "Action": "ec2:*",
            "Effect": "Allow",
            "Resource": "*"
        },
#        {
#            "Effect": "Allow",
#            "Action": "elasticloadbalancing:*",
#            "Resource": "*"
#        },
        {
            "Effect": "Allow",
            "Action": "cloudwatch:*",
            "Resource": "*"
        },
#        {
#            "Effect": "Allow",
#            "Action": "autoscaling:*",
#            "Resource": "*"
#        },
        {
            "Effect": "Allow",
            "Action": "iam:CreateServiceLinkedRole",
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "iam:AWSServiceName": [
#                        "autoscaling.amazonaws.com",
                        "ec2scheduled.amazonaws.com",
#                        "elasticloadbalancing.amazonaws.com",
                        "spot.amazonaws.com",
                        "spotfleet.amazonaws.com",
                        "transitgateway.amazonaws.com"
                    ]
                }
            }
        }


    ]
  })
}

resource "aws_iam_user" "testuser" {
  name = "testuser"
  path = "/"

  tags = {
    Access = "AmazonEC2FullAccess"
  }
}

#activer l'accès à la console
#créer la clé d'accès d'AWS CLI


#utput "secret_key" {
# value = aws_iam_access_key.AccK.secret
# sensitive = true
#

#utput "access_key" {
# value = aws_iam_access_key.AccK.id
#