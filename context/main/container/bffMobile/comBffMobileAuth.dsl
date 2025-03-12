comBffMobileAuth = component "Bff mobile Auth" {
    description "Handle /auth"

    -> comAuthEmailLogin "Call login with email endpoint"
    -> comRestUser "Get user"
}