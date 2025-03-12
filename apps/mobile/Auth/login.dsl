dynamic cMobile {
    title "[Mobile][Auth] Login"
    description "Patient could login into mobile app using email/password"

    pPatient -> comMobileLogin
    comMobileLogin -> comBffMobileAuth "Login with email/password"

    comBffMobileAuth -> comRestUser "Check login user if exist"
    comRestUser -> comDatabaseUserTable "Get user"

    comBffMobileAuth -> comAuthEmailLogin "Login with email/password"

    autolayout lr
}
