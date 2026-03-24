provider "vault" {
    address = "http://52.91.68.17:8200/"

    auth_login {
        path = "auth/approle/login"
        parameters = {
            role_id="905257ff-af65-8733-dc45-be3c735dd43d"
            secret_id="1960162d-4ce6-6cd5-d200-951a720c5620"
        }
      
    }
  
}
