Terraform module which create ECS Snapshot into OSS on Alibaba Cloud

terraform-alicloud-ecs-snapshot-oss
=====================================================================

[English](README.md) | 简体中文

本 Module 用于在阿里云为 ECS 创建存储到 OSS 中的快照。

本 Module 支持创建以下资源:

* [alicloud_instance](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/instance)
* [alicloud_ecs_snapshot](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/ecs_snapshot)
* [alicloud_snapshot_policy](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/snapshot_policy)
* [alicloud_oss_bucket](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/oss_bucket)

## 用法

```hcl
module "ecs-snapshot-oss" {
  source           = "terraform-alicloud-modules/ecs-snapshot-oss/alicloud"
  instance_name    = "tf-ecs-snapshot-oss"
  retention_days   = "20"
  category         = "standard"
  repeat_weekdays  = ["1", "2", "3"]
  time_points      = ["1", "22", "23"]
}
```

## 注意事项

* 本 Module 使用的 AccessKey 和 SecretKey 可以直接从 `profile` 和 `shared_credentials_file`
  中获取。如果未设置，可通过下载安装 [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) 后进行配置.

## 要求

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | > = 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | > = 1.128.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | > = 1.128.0 |

## 提交问题

如果在使用该 Terraform Module
的过程中有任何问题，可以直接创建一个 [Provider Issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new)，我们将根据问题描述提供解决方案。

**注意:** 不建议在该 Module 仓库中直接提交 Issue。

## 作者

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

## 许可

MIT Licensed. See LICENSE for full details.

## 参考

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)
