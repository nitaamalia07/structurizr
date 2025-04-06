workspace "Name" "Description"

    !identifiers hierarchical

    model {
        
    ss = softwareSystem "API Server" {
        as = container "Authentication Service" "Menangani login dan autentikasi pengguna"
        um = container "User Management" "Mengelola data pengguna dan profil"
        rs = container "Reservation Service" "Mengelola pemesanan dan jadwal reservasi"
        dm = container "Doctor Management" "Mengelola data dan jadwal dokter"
        md = container "Master Data Service" "Mengelola data master seperti faskes, poli, layanan, dan alamat"
        ps = container "Payment Service" "Menangani billing dan validasi pembayaran"
        ns = container "Notification Service" "Mengirim notifikasi kepada pengguna"
        ep = container "E-Prescription Service" "Mengelola resep elektronik dan histori konsultasi"
            
        db = container "PostgreSQL Database" "Database Schema" {
                tags "Database"
            }
        // Semua container internal akses ke database
        as -> db "Menyimpan dan membaca data dari database"
        um -> db "Menyimpan dan membaca data dari database"
        rs -> db "Menyimpan dan membaca data dari database"
        dm -> db "Menyimpan dan membaca data dari database"
        md -> db "Menyimpan dan membaca data dari database"
        ps -> db "Menyimpan dan membaca data dari database"
        ns -> db "Menyimpan dan membaca data dari database"
        ep -> db "Menyimpan dan membaca data dari database"

        // Interaksi antar container internal
        rs -> dm "Mengecek ketersediaan jadwal dokter"
        }
        //eksternal
        webapp = softwareSystem "Web Application" "Antarmuka pengguna untuk mengakses sistem Medpoint" (external)
        payment = softwareSystem "External Payment Gateway" "Pihak ketiga untuk menangani transaksi pembayaran" (external)
        notif = softwareSystem "Notification Service" "Layanan eksternal untuk mengirim notifikasi ke pengguna" (external)
        mobile = softwareSystem "Mobile App" "Aplikasi mobile untuk pasien" (external)
        
        // Akses dari Web App
        webapp -> ss.as "Melakukan login pengguna"
        webapp -> ss.rs "Mengelola data reservasi (lihat, ubah, batalkan)"
        webapp -> ss.dm "Mengelola data dokter"
        webapp -> ss.md "CRUD data master seperti poli, faskes, layanan, alamat"
        
         // Akses dari Mobile App
        mobile -> ss.as "Registrasi & login pengguna"
        mobile -> ss.rs "Membuat atau membatalkan reservasi"
        mobile -> ss.ps "Melakukan pembayaran tagihan"
        
        // Internal ke eksternal
        ss.ps -> payment "Mengirim data pembayaran ke gateway eksternal untuk validasi"
        ss.ns -> notif "Mengirim notifikasi ke pengguna melalui layanan eksternal"
        
        
       
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


  