terraform {
  backend "s3" {
    bucket               = "mybucket"
    workspace_key_prefix = "template"
    key                  = "path/to/my/key"
    region               = "us-east-1"
  }
}
