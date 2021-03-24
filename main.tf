terraform {
}

# This is a module to allow for multi-region enablement

# https://www.terraform.io/docs/providers/aws/r/securityhub_account.html

resource "aws_securityhub_account" "securityhub" {}

# No need to add specific AWS-native securityhub integrations like guardduty: it is done automatically
# https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-integrations-managing.html

data "aws_region" "current" {}

# https://www.terraform.io/docs/providers/aws/r/securityhub_product_subscription.html
# Twistlock aka Prisma Cloud integration for security hub
resource "aws_securityhub_product_subscription" "twistlock" {
  depends_on  = [aws_securityhub_account.securityhub]
  product_arn = "arn:aws:securityhub:${data.aws_region.current.name}:496947949261:product/twistlock/twistlock-enterprise"
}
