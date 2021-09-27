output "this_ecs_snapshot_oss_id" {
  value = alicloud_ecs_snapshot.default.id
}

output "this_ecs_snapshot_oss_name" {
  value = alicloud_ecs_snapshot.default.snapshot_name
}
