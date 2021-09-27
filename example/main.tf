variable "name" {
  default = "terraform_test"
}

provider "alicloud" {
  region  = "cn-hangzhou"
  profile = "default"
}

resource "alicloud_security_group" "default" {
  name        = var.name
  description = "foo"
  vpc_id      = alicloud_vpc.default.id
}

resource "alicloud_kms_key" "default" {
  description            = "Hello KMS"
  pending_window_in_days = "7"
  key_state              = "Enabled"
}

data "alicloud_zones" "default" {
  available_disk_category     = "cloud_efficiency"
  available_resource_creation = "VSwitch"
}

resource "alicloud_vpc" "default" {
  name       = var.name
  cidr_block = "172.16.0.0/16"
}

resource "alicloud_vswitch" "default" {
  vpc_id       = alicloud_vpc.default.id
  cidr_block   = "172.16.0.0/24"
  zone_id      = data.alicloud_zones.default.zones[0].id
  vswitch_name = var.name
}

resource "alicloud_instance" "default" {
  availability_zone          = "cn-hangzhou-b"
  security_groups            = alicloud_security_group.default.*.id
  instance_type              = "ecs.n4.large"
  image_id                   = "ubuntu_18_04_64_20G_alibase_20190624.vhd"
  instance_name              = "test_foo_1988"
  vswitch_id                 = alicloud_vswitch.default.id
  internet_max_bandwidth_out = 10
}

resource "alicloud_disk" "default" {
  availability_zone = "cn-hangzhou-b"
  size              = "50"
  tags              = {
    Name = "TerraformTest-disk"
  }
}

resource "alicloud_disk_attachment" "default" {
  disk_id     = alicloud_disk.default.id
  instance_id = alicloud_instance.default.id
}

module "example" {
  source  = "../"
  name    = var.name
  disk_id = alicloud_disk_attachment.default.disk_id
}
