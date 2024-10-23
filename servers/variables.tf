variable "domain" {
  description = "Root path for delivering downloads"
  type        = string
  default     = "cdn.o526.net"
}

variable "hosted_zone_id" {
  description = "Existing hosted zone for domain"
  type        = string
}
