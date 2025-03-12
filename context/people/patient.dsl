pPatient = person "Patient" {
    description "Uses the mobile app to book an appointment, view appointment details, and receive notifications."

    -> comMobileLogin "Patient can login into mobile app using email."
}