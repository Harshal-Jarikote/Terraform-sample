resource "aws_security_group" "jenkins_sg" {
  name   = "${var.env}-${var.region}-jenkins"
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name = "jenkins-${var.env}-${var.region}-sg"
  }
}

resource "aws_security_group_rule" "jenkins_sg_egress_tcp_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.jenkins_sg.id}"
  description       = "egress to all from jenkins sg"
}

resource "aws_security_group_rule" "jenkins_sg_ingress_to_port_22" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.jenkins_sg.id}"
  description       = "ingress to port 22 from all"
}

######################################

resource "aws_security_group" "app_sg" {
  name   = "${var.env}-${var.region}-app"
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name = "jenkins-${var.env}-${var.region}-sg"
  }
}

resource "aws_security_group_rule" "app_sg_egress_tcp_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.app_sg.id}"
  description       = "egress to all from jenkins sg"
}

resource "aws_security_group_rule" "app_sg_ingress_to_port_22" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = "${aws_security_group.jenkins_sg.id}"
  security_group_id        = "${aws_security_group.app_sg.id}"
  description              = "ingress to port 22 from jenkins"
}
