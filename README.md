Terraform module which create ECS Snapshot into OSS on Alibaba Cloud

terraform-alicloud-ecs-snapshot-oss
=====================================================================

English | [简体中文](README-CN.md)

This module is used to create ECS Snapshot into OSS under Alibaba Cloud.

These types of resources are supported:

* [alicloud_instance](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/instance)
* [alicloud_ecs_snapshot](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/ecs_snapshot)
* [alicloud_snapshot_policy](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/snapshot_policy)
* [alicloud_oss_bucket](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/oss_bucket)

## Usage

```hcl
module "ecs-snapshot-oss" {
  source          = "terraform-alicloud-modules/ecs-snapshot-oss/alicloud"
  instance_name   = "tf-ecs-snapshot-oss"
  retention_days  = "20"
  category        = "standard"
  repeat_weekdays = ["1", "2", "3"]
  time_points     = ["1", "22", "23"]
}
```

## Notes

* This module using AccessKey and SecretKey are from `profile` and `shared_credentials_file`. If you have not set them
  yet, please install [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) and configure it.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | > = 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | > = 1.128.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | > = 1.128.0 |

## Submit Issues

If you have any problems when using this module, please opening
a [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend opening an issue on this repo.

## Authors

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

## License

MIT Licensed. See LICENSE for full details.

## Reference

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)
