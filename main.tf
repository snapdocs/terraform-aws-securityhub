terraform {
}

# This is a module to allow for multi-region enablement

# https://www.terraform.io/docs/providers/aws/r/securityhub_account.html

resource "aws_securityhub_account" "securityhub" {}

# No need to add specific AWS-native securityhub integrations like guardduty: it is done automatically
# https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-integrations-managing.html

data "aws_region" "current" {}
