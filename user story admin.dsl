workspace "Name" "Description"

    !identifiers hierarchical

    model {
        sa = person "Admin"
        ss = softwareSystem "Web App (Manages master data)" {
            wa = container "Web App (Manages master data)"
            as = container "API Server (HTTP/REST)"
            db = container "Database (SQL)" {
                tags "Database"
            }
        }

         ssPayment = softwareSystem "External Payment Gateway" {
            tags "External System"
        }
        
        sa -> ss.wa "Login Login dan mengelola jadwal & pembayaran"
        ss.wa -> ss.as "Mengelola data master"
        ss.as -> ss.db "Mengelola data master"
        ss.as -> ssPayment "Memproses pembayaran"
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