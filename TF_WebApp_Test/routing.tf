data "aws_availability_zones" "available" {}

resource "aws_internet_gateway" "IG_Gateway" {
   vpc_id = "${aws_vpc.terraform_webapp.id}"
    tags {
        Name = "Internet Gateway"
    }
}
resource "aws_network_acl" "ACL" {
   vpc_id = "${aws_vpc.terraform_webapp.id}"
    egress {
        protocol = "-1"
        rule_no = 2
        action = "allow"
        cidr_block =  "0.0.0.0/0"
        from_port = 0
        to_port = 0
    }
    ingress {
        protocol = "-1"
        rule_no = 1
        action = "allow"
        cidr_block =  "0.0.0.0/0"
        from_port = 0
        to_port = 0
    }
    tags {
        Name = "Open ACL"
    }
}
resource "aws_eip" "Elastic" {
    vpc = true
}
resource "aws_nat_gateway" "NAT_Gateway" {
    allocation_id = "${aws_eip.Elastic.id}"
    subnet_id = "${aws_subnet.Public_Subnet.id}"
    depends_on = ["aws_internet_gateway.IG_Gateway"]
}
resource "aws_route_table" "Public_Route_Table" {
  vpc_id = "${aws_vpc.terraform_webapp.id}"
  tags {
      Name = "Public Routing Table"
  }
  route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.IG_Gateway.id}"
    }
}
resource "aws_route_table" "Private_Route_Table" {
  vpc_id = "${aws_vpc.terraform_webapp.id}"
  tags {
      Name = "Private Routing Table"
  }
  route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.NAT_Gateway.id}"
  }
}