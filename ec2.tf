locals {
  name_prefix = "${var.project_name}-${var.env}"
}

data "aws_ami" "ubuntu" {
    owners = ["099720109477"]
    most_recent = true

    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
    }
}

resource "aws_instance" "my_instance" {
    for_each = var.instance_configs

    ami = data.aws_ami.ubuntu.id
    instance_type = each.value

    user_data = file("${path.module}/user-data.sh")
    
    lifecycle {
        ignore_changes = [user_data]
    }

   tags = {
    Name = "${local.name_prefix}-${each.key}-ec2"
   }
}