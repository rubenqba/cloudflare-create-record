
output "records" {
  value = [
    for record in cloudflare_record.records : {
      name = record.name
      type = record.type
      fqdn = record.hostname
    }
  ]
  description = "List of DNS records managed by Terraform."
}
