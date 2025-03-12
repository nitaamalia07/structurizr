comRestUser = component "User RESTful endpoint" {
    description "Handle /api/v1/users"

    -> comDatabaseUserTable "Manage user's data"
}
