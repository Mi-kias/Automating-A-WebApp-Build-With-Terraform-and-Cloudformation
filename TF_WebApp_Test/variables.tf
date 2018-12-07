variable "region" {
  default = "us-east-1"
}
variable "LinuxAMI" {
  type = "map"
  default = {
    us-east-1 = "ami-009d6802948d06e52"
    us-east-2 = "ami-02e680c4540db351e"
    ap-northeast-1 = "ami-0a2de1c3b415889d2"
  }
  description = "Using Virginia, Ohio, and Tokyo for this demonstration"
}
variable "aws_access_key" {
  default = "AKIAJYMWOWWR7X2DTYHQ"
  description = "AWS_Access_Key"
}
variable "aws_secret_key" {
  default = "DLpS1vt5xKiq8wGDyjYDryr5GiNn7qyyycUI+P/g”
  description = "AWS_Secret_Key"
}
variable "VPC_CIDR" {
    default = "190.160.0.0/16"
  description = "VPC CIDR"
}
variable "Public_Subnet_CIDR" {
  default = "190.160.1.0/24"
  description = "Public Subnet CIDR"
}
variable "Private_Subnet_CIDR" {
  default = "190.160.2.0/24"
  description = "Private Subnet CIDR"
}
variable "key_pair" {
  default = ""
  description = "the ssh key to use for EC2 machines"
}
variable "DNS_Zone" {
  default = "terraformwebapptest.internal"
  description = "the internal dns name"
}