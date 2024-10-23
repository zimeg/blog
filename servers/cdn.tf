# https://search.opentofu.org/provider/opentofu/aws/latest/docs/resources/s3_bucket
resource "aws_s3_bucket" "cdn" {
  bucket = "cdn.o526.net"
}

# https://search.opentofu.org/provider/opentofu/aws/latest/docs/resources/s3_bucket_ownership_controls
resource "aws_s3_bucket_ownership_controls" "lock" {
  bucket = aws_s3_bucket.cdn.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# https://search.opentofu.org/provider/opentofu/aws/latest/docs/resources/s3_bucket
resource "aws_s3_bucket_acl" "private" {
  bucket = aws_s3_bucket.cdn.id
  acl    = "private"

  depends_on = [aws_s3_bucket_ownership_controls.lock]
}

# https://search.opentofu.org/provider/opentofu/aws/latest/docs/resources/cloudfront_origin_access_identity
resource "aws_cloudfront_origin_access_identity" "oai" {
  comment = "Access Identity for CloudFront to access S3"
}

# https://search.opentofu.org/provider/opentofu/aws/latest/docs/resources/s3_bucket_policy
resource "aws_s3_bucket_policy" "ticket" {
  bucket = aws_s3_bucket.cdn.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = aws_cloudfront_origin_access_identity.oai.iam_arn
        }
        Action   = "s3:GetObject"
        Resource = "${aws_s3_bucket.cdn.arn}/*"
      }
    ]
  })
}

# https://search.opentofu.org/provider/opentofu/aws/latest/docs/resources/cloudfront_distribution
resource "aws_cloudfront_distribution" "blog" {
  origin {
    domain_name = aws_s3_bucket.cdn.bucket_regional_domain_name
    origin_id   = "blog"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.oai.cloudfront_access_identity_path
    }
  }

  enabled         = true
  is_ipv6_enabled = true

  aliases = ["cdn.o526.net"]

  default_cache_behavior {
    target_origin_id       = "blog"
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    min_ttl     = 0
    default_ttl = 3600
    max_ttl     = 86400
  }

  price_class = "PriceClass_100"

  restrictions {
    geo_restriction {
      restriction_type = "none"
      locations        = []
    }
  }

  viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate_validation.cert.certificate_arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2018"
  }
}
