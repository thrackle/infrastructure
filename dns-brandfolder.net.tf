# Records for brandfolder.net
resource "aws_route53_zone" "brandfolder-net" {
   name = "brandfolder.net"
}

resource "aws_route53_record" "A-brandfolder-net" {
  zone_id = "${aws_route53_zone.brandfolder-net.zone_id}"
  name = "brandfolder.net"
  ttl = 3600
  type = "A"
  records = ["151.236.219.228"]
}

resource "aws_route53_record" "CNAME-email-brandfolder-net" {
  zone_id = "${aws_route53_zone.brandfolder-net.zone_id}"
  name = "email.brandfolder.net"
  ttl = 3600
  type = "CNAME"
  records = ["r.mailjet.com."]
}

resource "aws_route53_record" "TXT-mailjet-domainkey-brandfolder-net" {
  zone_id = "${aws_route53_zone.brandfolder-net.zone_id}"
  name = "mailjet._domainkey.brandfolder.net"
  ttl = 3600
  type = "TXT"
  records = ["k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDp73KT4fLlum0+dUQtKHAKXbhG4G48Jhp03lZhUlA8Q4O097Q1nbXNja5vRb/lvjxyp8nFhbc/g4bbbkJMzKJcMFe3kX9lYLfAwC70yLv1tgJPt6t+Xy4Li1yVYG+QEcczdIdeqAtWlvdpPvY3piiJdBvf9Q2T1aQYIl2wHq+JJwIDAQAB"]
}

resource "aws_route53_record" "TXT-brandfolder-net" {
  zone_id = "${aws_route53_zone.brandfolder-net.zone_id}"
  name = "brandfolder.net"
  ttl = 3600
  type = "TXT"
  records = ["v=spf1 a include:spf.mailjet.com ?all"]
}
