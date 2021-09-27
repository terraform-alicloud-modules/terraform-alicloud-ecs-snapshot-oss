variable "name" {
  description = "The specification of module name."
  type        = string
  default     = "terraform_name"
}

variable "disk_id" {
  description = "The ID of the disk."
  type        = string
  default     = ""
}

variable "category" {
  description = "The category of the snapshot."
  type        = string
  default     = "standard"
}

variable "retention_days" {
  description = "The retention period of the snapshot."
  type        = string
  default     = "20"
}

variable "description" {
  description = "The description of the snapshot."
  type        = string
  default     = "this snapshot is created for testing"
}

variable "repeat_weekdays" {
  description = "The automatic snapshot repetition dates."
  type        = list(string)
  default     = ["1","2","3"]
}

variable "time_points" {
  description = "The automatic snapshot creation schedule, and the unit of measurement is hour."
  type        = list(string)
  default     = ["1","22","23"]
}

variable "acl" {
  description = "The canned ACL to apply."
  type        = string
  default     = "public-read"
}
