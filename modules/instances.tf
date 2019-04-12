data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"] # Amazon Linux
}

resource "aws_instance" "jenkins" {
  ami                    = "${data.aws_ami.amazon_linux.id}"
  instance_type          = "${var.instance_type}"
  subnet_id              = "${aws_subnet.public.id}"
  vpc_security_group_ids = ["${aws_security_group.jenkins_sg.id}"]
  key_name               = "${var.key_name}"
  user_data              = "${var.user_data}"

  tags {
    "name" = "${var.env}-jenkins"
  }
}

resource "aws_instance" "app" {
  ami                    = "${data.aws_ami.amazon_linux.id}"
  instance_type          = "${var.instance_type}"
  subnet_id              = "${aws_subnet.private.id}"
  vpc_security_group_ids = ["${aws_security_group.app_sg.id}"]
  key_name               = "${var.key_name}"

  tags {
    "name" = "${var.env}-app"
  }
}
