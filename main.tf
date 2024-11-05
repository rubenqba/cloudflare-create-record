terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
}

data "cloudflare_zone" "zone" {
  name = var.domain_name
}

resource "cloudflare_record" "records" {
  for_each        = { for record in var.dns_records : record.name => record }
  zone_id         = data.cloudflare_zone.zone.zone_id
  name            = each.value.name
  type            = each.value.type
  content         = each.value.value
  allow_overwrite = true
  comment         = "handled by terraform"
}

