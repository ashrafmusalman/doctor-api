locals {
  aws_access_key = data.vault_kv_secret_v2.aws.data["access_key"]
  aws_secret_key = data.vault_kv_secret_v2.aws.data["secret_key"]

  db_username = data.vault_kv_secret_v2.db.data["db_username"]
  db_password = data.vault_kv_secret_v2.db.data["db_password"]
}