

# create ACM certificate and DNS validate
resource "aws_acm_certificate" "this" {
  provider = aws.global

  domain_name       = "${aws_api_gateway_rest_api.this.name}.${var.domain}"
  validation_method = "DNS"
}

resource "aws_route53_record" "cert_validate" {
  for_each = {
    for dvo in aws_acm_certificate.this.domain_validation_options : dvo.domain_name => {
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
  zone_id         = var.zone_id
}

resource "aws_acm_certificate_validation" "this" {
  provider = aws.global

  for_each = toset([
    for dvo in aws_acm_certificate.this.domain_validation_options : dvo.domain_name
  ])

  certificate_arn         = aws_acm_certificate.this.arn
  validation_record_fqdns = [aws_route53_record.cert_validate[each.key].fqdn]
}

# create and api gateway domain name
resource "aws_api_gateway_domain_name" "this" {
  domain_name     = "${aws_api_gateway_rest_api.this.name}.${var.domain}"
  certificate_arn = aws_acm_certificate.this.arn
  depends_on      = [aws_acm_certificate_validation.this]
}

# create a base path mapping
resource "aws_api_gateway_base_path_mapping" "this" {
  api_id      = aws_api_gateway_rest_api.this.id
  domain_name = aws_api_gateway_domain_name.this.domain_name
  stage_name  = aws_api_gateway_stage.this.stage_name
}

# Route53 record to API Gateway CloudFront domain name
resource "aws_route53_record" "this" {
  zone_id = var.zone_id
  name    = aws_api_gateway_domain_name.this.domain_name
  type    = "A"

  alias {
    name                   = aws_api_gateway_domain_name.this.cloudfront_domain_name
    zone_id                = aws_api_gateway_domain_name.this.cloudfront_zone_id
    evaluate_target_health = false
  }
}
