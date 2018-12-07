resource "aws_vpc_dhcp_options" "DHCP" {
    domain_name = "${var.DNS_Zone}"
    domain_name_servers = ["TF_AWS_TEST_DNS"]
    tags {
      Name = "Internal DNS"
    }
}
resource "aws_vpc_dhcp_options_association" "DNS_Resolve" {
    vpc_id = "${aws_vpc.terraform_webapp.id}"
    dhcp_options_id = "${aws_vpc_dhcp_options.DHCP.id}"
}
resource "aws_route53_zone" "Hosted_Zone" {
  name = "${var.DNS_Zone}"
  vpc_id = "${aws_vpc.terraform_webapp.id}"
  comment = "Hosted by Terraform"
}

resource "aws_route53_record" "DB_Records" {
   zone_id = "${aws_route53_zone.Hosted_Zone.zone_id}"
   name = "mydatabase.${var.DNS_Zone}"
   type = "A"
   ttl = "300"
   records = ["${aws_instance.database.private_ip}"]
}