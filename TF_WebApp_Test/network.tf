provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.region}"
}
resource "aws_vpc" "terraform_webapp" {
    cidr_block = "${var.VPC_CIDR}"
    enable_dns_support = true
    enable_dns_hostnames = true
    tags {
      Name = "Terraform PHP Configuration"
    }
}