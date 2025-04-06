workspace "Name" "Description"

    !identifiers hierarchical

    model {
        u = person "Pasien" "Membuat reservasi, membatalkan, dan melakukan pembayaran."
        a = person "Admin" "Mengelola data master, jadwal, slot reservasi, dan pembayaran."
        sa = person "SuperAdmin" "Mengelola semua data master dan hak akses pengguna."
        d  = person "Dokter" "Menyediakan slot reservasi, menyetujui reservasi, memberikan konsultasi dan resep obat."
        ss = softwareSystem "Medpoint System" {
            ms = container "Medpoint System"
            db = container "Database Schema" {
                tags "Database"
            }
        }
        payment = softwareSystem "External Payment Gateway" "Pihak ketiga untuk menangani transaksi pembayaran" (external)
        notif = softwareSystem "Notification Service" "Layanan eksternal untuk mengirim notifikasi ke pengguna" (external)
        
        a  -> ss.ms "menggunakan aplikasi web"
        u  -> ss.ms "menggunakan aplikasi mobile"
        sa -> ss.ms "menggunakan aplikasi web"
        d  -> ss.ms "menggunakan aplikasi web"
        ss.ms -> ss.db "Reads from and writes to"
        ss.ms -> payment "Melakukan proses pembayaran"
        ss.ms -> notif "Mengirimkan notifikasi reservasi dan update"
       
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


  