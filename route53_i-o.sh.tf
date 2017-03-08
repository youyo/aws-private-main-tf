data "aws_route53_zone" "i-o-sh" {
  provider     = "aws.ailas_us_east_1"
  name         = "i-o.sh."
  private_zone = false
}

resource "aws_route53_record" "play_factorio_game" {
  zone_id = "${data.aws_route53_zone.i-o-sh.zone_id}"
  name    = "play.factorio.game.i-o.sh"
  type    = "A"
  ttl     = 300
  records = ["103.55.157.41"]
}

resource "aws_route53_record" "dl" {
  zone_id = "${data.aws_route53_zone.i-o-sh.zone_id}"
  name    = "dl.i-o.sh"
  type    = "CNAME"
  ttl     = 300
  records = ["nonssl.global.fastly.net."]
}

resource "aws_route53_record" "grl" {
  zone_id = "${data.aws_route53_zone.i-o-sh.zone_id}"
  name    = "grl.i-o.sh"
  type    = "CNAME"
  ttl     = 300
  records = ["grl.i-o.sh.herokudns.com."]
}

resource "aws_route53_record" "i-o-sh-mx" {
  zone_id = "${data.aws_route53_zone.i-o-sh.zone_id}"
  name    = "i-o.sh"
  type    = "MX"
  ttl     = 300
  records = ["10 mail.i-o.sh."]
}

resource "aws_route53_record" "mail" {
  zone_id = "${data.aws_route53_zone.i-o-sh.zone_id}"
  name    = "mail.i-o.sh"
  type    = "A"
  ttl     = 300
  records = ["54.249.87.250"]
}

resource "aws_route53_record" "aws_cloud" {
  zone_id = "${data.aws_route53_zone.i-o-sh.zone_id}"
  name    = "aws.cloud.i-o.sh"
  type    = "MX"
  ttl     = 300
  records = ["10 mail.i-o.sh."]
}
