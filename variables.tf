
variable "cloudflare_api_token" {
  sensitive = true
}

variable "domain_name" {
  type = string
  description = "Cloudflare Domain Name"
}

variable "dns_records" {
  type = list(object({
    name  = string
    type = string
    value = string
  }))
  description = "Record list to define"
}
