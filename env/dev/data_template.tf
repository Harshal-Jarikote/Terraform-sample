data "template_file" "init" {
  template = "${file("userdata.tpl")}"
}
