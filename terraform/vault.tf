provider "vault" {
    address = "http://34.207.141.128:8200/"

    auth_login {
        path = "auth/approle/login"
        parameters = {
            role_id=" 8db07e61-ac3d-a2e8-4c10-ee62a3b41450"
            secret_id="  7abb017a-4855-dc18-349c-97423305c7f4"
        }
      
    }
  
}
