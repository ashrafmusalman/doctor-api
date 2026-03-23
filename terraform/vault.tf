provider "vault" {
    address = "http://18.207.125.97:8200/"

    auth_login {
        path = "auth/approle/login"
        parameters = {
            role_id=" e1983a2a-6c8d-6992-7788-bd750cf4e465"
            secret_id="24518e97-5394-3362-8b08-52389655f387"
        }
      
    }
  
}
