# Terraform Assessment

This module aims to assess the candidate's Terraform knowledge by asking a number of questions. It is recommended to have terraform installed as it may make it easier for you to share your working

## Scenario

A junior member of staff has written some terraform. They have asked you to help

## Question 1

Your colleague appears to be having errors when testing their terrform. Please help by fixing the terraform for them and walking through what you did.
1 - Executar terraform validate para encontrar erros de síntaxe

```
# terraform validate
```

Resultado:

```
    Error: Invalid resource type
│
│   on main.tf line 1, in resource "aws_instanc" "test_instance":
│    1: resource "aws_instanc" "test_instance" {
│
│ The provider hashicorp/aws does not support resource type "aws_instanc". Did you mean "aws_instance"?
```

Para corrigir mudou "aws_instanc" para "aws_instance".

2 - Executar terraform plan

```
# terraform plan -var-file=configurations/dev/us-east-1/dev.tf
```

Resultado:

```
Error: Unexpected "tags" block
│
│   on configurations/dev/us-east-1/dev.tf line 7:
│    7: tags {
│
│ Blocks are not allowed here.
```

Para corrigir:

```
tags {
  ApplicationID = "APP1234567"
  Description   = "Test Instance"
  Environment   = "DEV"
  GBL           = "123456789"
  Owner         = "MANAGER@test.com"
  Name          = "US-EAST-DEV-US-TESTAPP"
}
```

```
tags = {
  ApplicationID = "APP1234567"
  Description   = "Test Instance"
  Environment   = "DEV"
  GBL           = "123456789"
  Owner         = "MANAGER@test.com"
  Name          = "US-EAST-DEV-US-TESTAPP"
}
```

3 - Executar terraform plan novamente

```
# terraform plan -var-file=configurations/dev/us-east-1/dev.tf
```

Resultado:

```
 on main.tf line 17, in resource "aws_security_group" "test_instance_sg":
│   17:     cidr_blocks = var.ssh_cidr
│     ├────────────────
│     │ var.ssh_cidr is "10.0.0.0/16"
│
│ Inappropriate value for attribute "cidr_blocks": list of string required.
```

Para corrigir:

```
ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ssh_cidr
  }
```

```
ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_cidr]
  }
```

## Question 2

The terraform would need its state storing and this code has not been added. Please write some terraform so that the state can be stored safely

1 - Escrever aquivo backend.tf

```
terraform {
  backend "s3" {
    bucket               = "mybucket"
    workspace_key_prefix = "template"
    key                  = "path/to/my/key"
    region               = "us-east-1"
  }
}
```

## Question 3

A new request to add a SQL database has come in. It would interact with the service currently being created here. Please suggest a resource that would fill this requirement and write the terraform to create this.

1 - Criar security group do RDS
2 - Permitir apenas que na porta 3006 ocorra a comunicação com a instância
