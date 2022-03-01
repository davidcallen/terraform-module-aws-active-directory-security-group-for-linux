# ---------------------------------------------------------------------------------------------------------------------
# A Security Group for use by linux ec2 instance to join and communicate with an AD domain
#
# For required ports see
#     https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/windows_integration_guide/sssd-integration-intro#sssd-req-ports-client
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_security_group" "ad-from-linux" {
  name        = "${var.environment.resource_name_prefix}-${var.name}"
  description = "support-desktop"
  vpc_id      = var.vpc.vpc_id
  tags = merge(var.global_default_tags, var.environment.default_tags, {
    Name            = "${var.environment.resource_name_prefix}-${var.name}"
    Application     = "support-desktop"
    ApplicationName = var.name
  })
}

# All ingress and egress to port 53 (DNS)
resource "aws_security_group_rule" "ad-from-linux-allow-ingress-dns-tcp" {
  type            = "ingress"
  description     = "DNS"
  from_port       = 53
  to_port         = 53
  protocol        = "tcp"
  cidr_blocks     = var.ad_ip_cidrs
  security_group_id = aws_security_group.ad-from-linux.id
}
resource "aws_security_group_rule" "ad-from-linux-allow-ingress-dns-udp" {
  type            = "ingress"
  description     = "DNS"
  from_port       = 53
  to_port         = 53
  protocol        = "udp"
  cidr_blocks     = var.ad_ip_cidrs
  security_group_id = aws_security_group.ad-from-linux.id
}
resource "aws_security_group_rule" "ad-from-linux-allow-egress-dns-tcp" {
  type            = "egress"
  description     = "DNS"
  from_port       = 53
  to_port         = 53
  protocol        = "tcp"
  cidr_blocks     = var.ad_ip_cidrs
  security_group_id = aws_security_group.ad-from-linux.id
}
resource "aws_security_group_rule" "ad-from-linux-allow-egress-dns-udp" {
  type            = "egress"
  description     = "DNS"
  from_port       = 53
  to_port         = 53
  protocol        = "udp"
  cidr_blocks     = var.ad_ip_cidrs
  security_group_id = aws_security_group.ad-from-linux.id
}

# All ingress and egress to port 53 (LDAP)
resource "aws_security_group_rule" "ad-from-linux-allow-ingress-ldap-tcp" {
  type            = "ingress"
  description     = "LDAP"
  from_port       = 389
  to_port         = 389
  protocol        = "tcp"
  cidr_blocks     = var.ad_ip_cidrs
  security_group_id = aws_security_group.ad-from-linux.id
}
resource "aws_security_group_rule" "ad-from-linux-allow-ingress-ldap-udp" {
  type            = "ingress"
  description     = "LDAP"
  from_port       = 389
  to_port         = 389
  protocol        = "udp"
  cidr_blocks     = var.ad_ip_cidrs
  security_group_id = aws_security_group.ad-from-linux.id
}
resource "aws_security_group_rule" "ad-from-linux-allow-egress-ldap-tcp" {
  type            = "egress"
  description     = "LDAP"
  from_port       = 389
  to_port         = 389
  protocol        = "tcp"
  cidr_blocks     = var.ad_ip_cidrs
  security_group_id = aws_security_group.ad-from-linux.id
}
resource "aws_security_group_rule" "ad-from-linux-allow-egress-ldap-udp" {
  type            = "egress"
  description     = "LDAP"
  from_port       = 389
  to_port         = 389
  protocol        = "udp"
  cidr_blocks     = var.ad_ip_cidrs
  security_group_id = aws_security_group.ad-from-linux.id
}

# All ingress and egress to port 88 (Kerberos)
resource "aws_security_group_rule" "ad-from-linux-allow-ingress-kerberos-tcp" {
  type            = "ingress"
  description     = "Kerberos"
  from_port       = 88
  to_port         = 88
  protocol        = "tcp"
  cidr_blocks     = var.ad_ip_cidrs
  security_group_id = aws_security_group.ad-from-linux.id
}
resource "aws_security_group_rule" "ad-from-linux-allow-ingress-kerberos-udp" {
  type            = "ingress"
  description     = "Kerberos"
  from_port       = 88
  to_port         = 88
  protocol        = "udp"
  cidr_blocks     = var.ad_ip_cidrs
  security_group_id = aws_security_group.ad-from-linux.id
}
resource "aws_security_group_rule" "ad-from-linux-allow-egress-kerberos-tcp" {
  type            = "egress"
  description     = "Kerberos"
  from_port       = 88
  to_port         = 88
  protocol        = "tcp"
  cidr_blocks     = var.ad_ip_cidrs
  security_group_id = aws_security_group.ad-from-linux.id
}
resource "aws_security_group_rule" "ad-from-linux-allow-egress-kerberos-udp" {
  type            = "egress"
  description     = "Kerberos"
  from_port       = 88
  to_port         = 88
  protocol        = "udp"
  cidr_blocks     = var.ad_ip_cidrs
  security_group_id = aws_security_group.ad-from-linux.id
}

# All ingress and egress to port 464 (Kerberos kadmin)
resource "aws_security_group_rule" "ad-from-linux-allow-ingress-kerberos-kadmin-tcp" {
  type            = "ingress"
  description     = "Kerberos kadmin"
  from_port       = 464
  to_port         = 464
  protocol        = "tcp"
  cidr_blocks     = var.ad_ip_cidrs
  security_group_id = aws_security_group.ad-from-linux.id
}
resource "aws_security_group_rule" "ad-from-linux-allow-ingress-kerberos-kadmin-udp" {
  type            = "ingress"
  description     = "Kerberos kadmin"
  from_port       = 464
  to_port         = 464
  protocol        = "udp"
  cidr_blocks     = var.ad_ip_cidrs
  security_group_id = aws_security_group.ad-from-linux.id
}
resource "aws_security_group_rule" "ad-from-linux-allow-egress-kerberos-kadmin-tcp" {
  type            = "egress"
  description     = "Kerberos kadmin"
  from_port       = 464
  to_port         = 464
  protocol        = "tcp"
  cidr_blocks     = var.ad_ip_cidrs
  security_group_id = aws_security_group.ad-from-linux.id
}
resource "aws_security_group_rule" "ad-from-linux-allow-egress-kerberos-kadmin-udp" {
  type            = "egress"
  description     = "Kerberos kadmin"
  from_port       = 464
  to_port         = 464
  protocol        = "udp"
  cidr_blocks     = var.ad_ip_cidrs
  security_group_id = aws_security_group.ad-from-linux.id
}

# All ingress and egress to port 3268 (LDAP Global Catalog)
resource "aws_security_group_rule" "ad-from-linux-allow-ingress-ldap-global-catalog-tcp" {
  type            = "ingress"
  description     = "LDAP Global Catalog"
  from_port       = 3268
  to_port         = 3268
  protocol        = "tcp"
  cidr_blocks     = var.ad_ip_cidrs
  security_group_id = aws_security_group.ad-from-linux.id
}
resource "aws_security_group_rule" "ad-from-linux-allow-ingress-ldap-global-catalog-udp" {
  type            = "ingress"
  description     = "LDAP Global Catalog"
  from_port       = 3268
  to_port         = 3268
  protocol        = "udp"
  cidr_blocks     = var.ad_ip_cidrs
  security_group_id = aws_security_group.ad-from-linux.id
}
resource "aws_security_group_rule" "ad-from-linux-allow-egress-ldap-global-catalog-tcp" {
  type            = "egress"
  description     = "LDAP Global Catalog"
  from_port       = 3268
  to_port         = 3268
  protocol        = "tcp"
  cidr_blocks     = var.ad_ip_cidrs
  security_group_id = aws_security_group.ad-from-linux.id
}
resource "aws_security_group_rule" "ad-from-linux-allow-egress-ldap-global-catalog-udp" {
  type            = "egress"
  description     = "LDAP Global Catalog"
  from_port       = 3268
  to_port         = 3268
  protocol        = "udp"
  cidr_blocks     = var.ad_ip_cidrs
  security_group_id = aws_security_group.ad-from-linux.id
}

# All ingress and egress to port 123 (NTP)
resource "aws_security_group_rule" "ad-from-linux-allow-ingress-ntp-tcp" {
  type            = "ingress"
  description     = "NTP"
  from_port       = 123
  to_port         = 123
  protocol        = "tcp"
  cidr_blocks     = var.ad_ip_cidrs
  security_group_id = aws_security_group.ad-from-linux.id
}
resource "aws_security_group_rule" "ad-from-linux-allow-ingress-ntp-udp" {
  type            = "ingress"
  description     = "NTP"
  from_port       = 123
  to_port         = 123
  protocol        = "udp"
  cidr_blocks     = var.ad_ip_cidrs
  security_group_id = aws_security_group.ad-from-linux.id
}
resource "aws_security_group_rule" "ad-from-linux-allow-egress-ntp-tcp" {
  type            = "egress"
  description     = "NTP"
  from_port       = 123
  to_port         = 123
  protocol        = "tcp"
  cidr_blocks     = var.ad_ip_cidrs
  security_group_id = aws_security_group.ad-from-linux.id
}
resource "aws_security_group_rule" "ad-from-linux-allow-egress-ntp-udp" {
  type            = "egress"
  description     = "NTP"
  from_port       = 123
  to_port         = 123
  protocol        = "udp"
  cidr_blocks     = var.ad_ip_cidrs
  security_group_id = aws_security_group.ad-from-linux.id
}

# DEBUG DEBUG DEBUG DEBUG
# DEBUG DEBUG DEBUG DEBUG

# All ingress and egress to port ALL HACK temporary
resource "aws_security_group_rule" "ad-from-linux-allow-ingress-HACK" {
  type            = "ingress"
  description     = "HACK all"
  from_port       = 0
  to_port         = 65535
  protocol        = "all"
  cidr_blocks     = var.ad_ip_cidrs
  security_group_id = aws_security_group.ad-from-linux.id
}
resource "aws_security_group_rule" "ad-from-linux-allow-egress-HACK" {
  type            = "egress"
  description     = "HACK all"
  from_port       = 0
  to_port         = 65535
  protocol        = "all"
  cidr_blocks     = var.ad_ip_cidrs
  security_group_id = aws_security_group.ad-from-linux.id
}
# All ingress and egress to port ALL HACK temporary