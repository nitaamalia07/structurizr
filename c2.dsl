workspace "Name" "Description"

    !identifiers hierarchical

    model {
        sa = person "SuperAdmin" "Mengelola semua data master dan hak akses pengguna."
         a = person "Admin" "Mengelola data master, jadwal, slot reservasi, dan pembayaran."
         d = person "Doctor" "Menyediakan slot reservasi, menyetujui reservasi, memberikan konsultasi dan resep obat."
         p = person "Pasien" "Membuat reservasi, membatalkan, dan melakukan pembayaran."
        ss = softwareSystem "Medpoint System" {
         wa = container "Web App" "Frontend berbasis web untuk dokter, admin dan superadmin (TypeScript + React JS)"
          ma = container "Mobile App" "Frontend mobile untuk pengguna (Dart + Flutter)"
         api = container "API Service" "Back-end berbasis Go + Raiden Framework"
            db = container "Database" "PostgreSQL" {
                tags "Database"
            }
        }
        
        //external
        pay = softwareSystem "Payment Gateway" "Menyediakan layanan pembayaran" {
        tags "External"
     }
        notif = softwareSystem "Notification Service" "Mengirimkan notifikasi ke user" {
        tags "External"
    }
        
        // Hubungan antara actor dan container
        sa -> ss.wa "Menggunakan Web App"
        a -> ss.wa "Menggunakan Web App"
        d -> ss.wa "Menggunakan Web App"
        p -> ss.ma "Menggunakan Mobile App"
       
        
        ss.wa -> ss.api "Calls api, minta data jadwal dokter (data dokter, master data)"
        ss.ma -> ss.api "Calls api, melakukan reservasi (booking, batal, kelola profil pengguna)"
        ss.api -> ss.db "API menyimpan data , membaca informasi, auth dan user, reservasi, payment, dan master data"
        ss.api -> pay "Memproses transaksi pembayaran (validasi+melakukan pembayaran)"
        ss.api -> notif "Mengirimkan notifikasi(reservasi+pembayaran berhasil)"
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