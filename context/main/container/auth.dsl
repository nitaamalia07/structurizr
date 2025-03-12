cAuth = container "Supabase Auth service" {
    description "Backend to handle authn/authz"
    technology "Supabase"

    comAuthEmailLogin = component "Auth Email Login" {
        description "Handle /login/email"
        -> comDatabaseUserTable "Check if user's email exists"
        -> ssExternalAuth "Initiate Username/Password auth flow"
    }
}
