terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      Version = "~>3.27"
    }
  }

  required_version = ">=0.14.9"

    backend "s3" {
        bucket = "[jlaremotestatebucket]"
        region = "eu-west-3"
  }
}

provider "aws" {
  version = "~>3.0"
  region  = "eu-west-3"
}

resource "aws_s3_bucket" "s3Bucket" {
     bucket = "[jlamywwwbucket]"
     acl       = "public-read"

     policy  = <<EOF
{
     "id" : "MakePublic",
   "version" : "2012-10-17",
   "statement" : [
      {
         "action" : [
             "s3:GetObject"
          ],
         "effect" : "Allow",
         "resource" : "arn:aws:s3:::[jlamywwwbucket]/*",
         "principal" : "*"
      }
    ]
  }
EOF

   website {
       index_document = "index.html"
   }
}
