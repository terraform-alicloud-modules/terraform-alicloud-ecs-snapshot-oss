resource "alicloud_ecs_snapshot" "default" {
  disk_id        = var.disk_id
  snapshot_name  = var.name
  category       = var.category
  retention_days = var.retention_days
  description    = var.description
  tags           = {
    Created = var.ecs_snapshot_tags["created"]
    For     = var.ecs_snapshot_tags["for"]
  }
}

resource "alicloud_snapshot_policy" "default" {
  name            = var.name
  repeat_weekdays = var.repeat_weekdays
  retention_days  = var.retention_days
  time_points     = var.time_points
}

resource "alicloud_oss_bucket" "default" {
  bucket = var.name
  acl    = var.acl
}

resource "alicloud_oss_bucket_object" "object-content" {
  bucket  = alicloud_oss_bucket.default.bucket
  key     = alicloud_ecs_snapshot.default.snapshot_name
  content = alicloud_ecs_snapshot.default.snapshot_name
}
