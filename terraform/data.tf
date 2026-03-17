data "vault_kv_secret_v2" "aws" {
  mount = "secret"
  name  = "aws"
}

data "vault_kv_secret_v2" "db" {
  mount = "secret"
  name  = "database"
}