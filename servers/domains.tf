# https://search.opentofu.org/provider/opentofu/aws/latest/docs/resources/acm_certificate
resource "aws_acm_certificate" "cert" {
  domain_name       = var.domain
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

# https://search.opentofu.org/provider/opentofu/aws/latest/docs/resources/acm_certificate_validation
resource "aws_acm_certificate_validation" "cert" {
  certificate_arn         = aws_acm_certificate.cert.arn
  validation_record_fqdns = [for record in aws_route53_record.default_records : record.fqdn]
}

# https://search.opentofu.org/provider/opentofu/aws/latest/docs/resources/route53_record
resource "aws_route53_record" "default_records" {
  for_each = {
    for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = var.hosted_zone_id
}

# https://search.opentofu.org/provider/opentofu/aws/latest/docs/resources/route53_record
resource "aws_route53_record" "root" {
  name    = var.domain
  type    = "A"
  zone_id = var.hosted_zone_id

  alias {
    evaluate_target_health = true
    name                   = aws_cloudfront_distribution.blog.domain_name
    zone_id                = aws_cloudfront_distribution.blog.hosted_zone_id
  }
}
