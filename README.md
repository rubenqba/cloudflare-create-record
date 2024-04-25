# Terraform Module: cloudflare-create-record

This Terraform module allows users to create DNS records in Cloudflare. This module is highly reusable and can be easily imported into other Terraform projects for managing Cloudflare DNS records.

## Configuration

The module requires the following variables to function properly:

- `cloudflare_api_token`: This is the Cloudflare API key that will be used to authenticate the API requests. It should be provided by the user when configuring the module.
- `domain_name`: This is a string variable indicating the name of the Cloudflare domain to manage.
- `dns_records`: This is a list of objects representing the DNS records to be managed in Cloudflare. Each object in the list should have name, type, and value. The name is a string representing the name of the record, type is also a string indicating the type of record (e.g., "A", "CNAME", etc.), and value is a string indicating the value associated with the record.

## Usage

To use this module in your Terraform configuration, import it with the following HCL code:

```hcl
module "dns_management" {
  source  = "git::https://github.com/rubenqba/cloudflare-create-record.git"
  cloudflare_api_token = "${var.cloudflare_api_token}"
  domain_name  = "${var.domain_name}"
  dns_records  = [
    {
      name = "www"
      type = "A"
      value = "192.0.2.1"
    },
    {
      name = "api"
      type = "CNAME"
      value = "api.mysite.net"
    }
  ]
}
```

Replace `${var.cloudflare_api_token}` with your Cloudflare API token and `${var.domain_name}` with your domain name. Also, modify `dns_records` to match the records you want to manage.

After setting up, you can run `terraform apply` to create or manage your DNS records in the Cloudflare account.

## Output

After running `terraform apply`, the module will output a list of objects representing the DNS records that have been managed. The output might look like the following example:

```hcl
records = [
  {
    "fqdn" = "www.your-domain-name.com"
    "name" = "www"
    "type" = "A"
  },
  {
    "fqdn" = "api.your-domain-name.com"
    "name" = "api"
    "type" = "CNAME"
  },
]
```

Each object will provide the `name`, `type`, and `fqdn` of the DNS record.

## Note

Please ensure your Cloudflare authentication credentials are correctly set up before using this module.

This module is intended to be used with the latest version of Terraform. If you are using an earlier version of Terraform, some functionalities might not work properly.