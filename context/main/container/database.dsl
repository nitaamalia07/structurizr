cDatabase = container "Database" {
    description "Stores all data for the application."
    tags "Database"
    technology "PostgreSQL"

    !include database
}
