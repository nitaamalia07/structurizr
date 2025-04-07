workspace "Name" "Description"

    !identifiers hierarchical

    model {
        sa = person "Pasien"
        ss = softwareSystem "Mobile App (Makes reservations)" {
            ma = container "Mobile App (Makes reservations)"
            as = container "API Server (HTTP/REST)"
            db = container "Database (SQL)" {
                tags "Database"
            }
        }

         ssPayment = softwareSystem "External Payment Gateway" {
            tags "External System"
        }
        
        sa -> ss.ma "Registrasi ke sistem"
        ss.ma -> ss.as "Membuat reservasi"
        ss.as -> ss.db "Mengelola data master"
        ss.as -> ssPayment "Melakukan pembayaran"
    }

    views {
        systemContext ss "Diagram1" {
            include *
            autolayout lr
        }

        container ss "Diagram2" {
            include *
            autolayout lr
        }

        styles {
            element "Element" {
                color white
            }
            element "Person" {
                background #116611
                shape person
            }
            element "Software System" {
                background #2D882D
            }
            element "Container" {
                background #55aa55
            }
            element "Database" {
                shape cylinder
            }
        }
    }

}