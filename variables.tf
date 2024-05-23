
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
  validation {
    condition = alltrue([
      for record in var.dns_records : 
      can(contains(["A", "AAAA", "CAA", "CNAME", "TXT", "SRV", "LOC", "MX", "NS", "SPF", "CERT", "DNSKEY", "DS", "NAPTR", "SMIMEA", "SSHFP", "TLSA", "URI", "PTR", "HTTPS", "SVCB"], record.type))
    ])
    error_message = "Record type mus be one of: A, AAAA, CAA, CNAME, TXT, SRV, LOC, MX, NS, SPF, CERT, DNSKEY, DS, NAPTR, SMIMEA, SSHFP, TLSA, URI, PTR, HTTPS, SVCB"
  }
}

variable "allow_overwrite" {
  type  = bool
  description = "Allow to override DNS record"
  default = true
}

variable "proxied" {
  type = bool
  description = "Whether the record get Cloudflare's domain protection"
  default = true
}