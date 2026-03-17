provider "vault" {
    address = "http://100.53.135.0:8200"

    auth_login {
        path = "auth/approle/login"
        parameters = {
            role_id="455ca385-38dd-ee10-832e-ef5137e79bc7"
            secret_id="70822243-5df0-59ea-aaaf-4044749ea04b"
        }
      
    }
  
}