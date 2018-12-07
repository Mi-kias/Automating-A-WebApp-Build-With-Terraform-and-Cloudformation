resource "aws_subnet" "Public_Subnet" {
  vpc_id = "${aws_vpc.terraform_webapp.id}"
  cidr_block = "${var.Public_Subnet_CIDR}"
  tags {
        Name = "Public Subnet"
  }
 availability_zone = "${data.aws_availability_zones.available.names[0]}"
}
resource "aws_route_table_association" "Public_Route_Association" {
    subnet_id = "${aws_subnet.Public_Subnet.id}"
    route_table_id = "${aws_route_table.Public_Route_Table.id}"
}
resource "aws_subnet" "Private_Subnet" {
  vpc_id = "${aws_vpc.terraform_webapp.id}"
  cidr_block = "${var.Private_Subnet_CIDR}"
  tags {
        Name = "Private Subnet"
  }
  availability_zone = "${data.aws_availability_zones.available.names[1]}"
}
resource "aws_route_table_association" "Private_Subnet_Association" {
    subnet_id = "${aws_subnet.Private_Subnet.id}"
    route_table_id = "${aws_route_table.Private_Route_Table.id}"
}