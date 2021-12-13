ami_id        = "ami-123456"
environment   = "dev"
instance_type = "i3.micro"
ssh_cidr      = "10.0.0.0/16"
vpc_id        = "vpc-12345678"

tags = {
  ApplicationID = "APP1234567"
  Description   = "Test Instance"
  Environment   = "DEV"
  GBL           = "123456789"
  Owner         = "MANAGER@test.com"
  Name          = "US-EAST-DEV-US-TESTAPP"
}
