### Prerequesites
- Install docker https://www.docker.com

### How to run

1. Clone this repo
2. Run `make run` in terminal
3. Navigate to localhost:8085 for the C4 diagram

### Mohon maaf 
Mohon maaf karena vs code saya mengalami eror saat saya mau jalankan make run. 
Saya membuat C4 Model ini secara manual menggunakan structurizr web dan plantuml.

### Recording
Link recording: 
1. C1 https://jam.dev/c/72ee74fd-f5ac-4938-901d-25c607685602
2. C2 https://jam.dev/c/f42911de-cf18-4ae6-bd80-851c855ff6a1
3. C3 https://jam.dev/c/5c0077be-e4bf-46b5-910c-4225ec23938c
4. C4 https://jam.dev/c/c76d9735-551e-42a2-8c6e-f5433a788f1a


---
## C4 Models untuk Sistem Medpoint
Repositori ini berisi diagram C4 model untuk sistem Medpoint Mediverse, yang menggambarkan arsitektur dan struktur sistem dari level tinggi hingga komponen-komponen di dalamnya. Sistem Medpoint adalah platform yang memungkinkan pengguna melakukan reservasi medis online, seperti konsultasi dokter, tes lab, tindakan medis, dan vaksinasi.

## Prasyarat
Untuk menjalankan sistem dan melihat diagram C4, Anda perlu menginstal Docker. Anda bisa mengunduh dan menginstal Docker melalui tautan berikut:
[Panduan Instalasi Docker](https://www.docker.com)

## Cara Menjalankan
1. **Clone repositori ini**:
   ```bash
   git clone https://github.com/nitaamalia07/c4-models.git
   cd c4-models
   ```
2. **Jalankan aplikasi**:
   ```bash
   make run
   docker run -it --rm -p 8085:8080 -v ./:/usr/local/structurizr structurizr/lite
   ```
3. **Buka browser Anda** dan navigasikan ke `localhost:8085` untuk melihat diagram C4.

## Diagram C4
Diagram C4 untuk sistem Medpoint:
- **Diagram Konteks (C1)**
- **Diagram Container (C2)**
- **Diagram Komponen (C3)**
- **Diagram Kode (C4)**

### Gambaran Sistem Medpoint
Medpoint adalah platform online yang memudahkan pengguna untuk melakukan reservasi medis. Pengguna dapat mencari dokter, fasilitas kesehatan (faskes), dan membuat janji temu untuk konsultasi, tes, atau tindakan medis lainnya. Sistem ini menyediakan berbagai fitur untuk mempermudah proses reservasi dan pengelolaan data medis.
Sistem ini dikembangkan menggunakan teknologi berikut:
- **Raiden Framework**
- **Go** untuk Back-End
- **TypeScript dan React JS** untuk Web Front-End
- **Dart & Flutter** untuk Mobile Front-End
- **PostgreSQL** untuk Database
Untuk informasi lebih lanjut, lihat dokumentasi Raiden Framework di: [Raiden Framework Documentation](https://raiden.sev-2.com/)

### Pengguna Utama
1. **Super Admin** – Mengelola data master dan hak akses pengguna.
2. **Admin** – Mengelola data master, jadwal, slot reservasi, dan pembayaran.
3. **User** – Membuat reservasi, membatalkan, dan melakukan pembayaran.
4. **Doctor** – Menyediakan slot reservasi, menyetujui reservasi, memberikan konsultasi, dan resep obat.

### Fitur Utama
#### Fitur CMS:
- **Auth dan Manajemen Pengguna**: Admin bisa login dan mengelola profil pengguna.
- **Reservasi**: Super Admin bisa mengelola booking, reschedule, dan cancel reservasi.
- **Data Dokter**: Super Admin bisa mengelola data dokter.
- **Data Master**: Super Admin bisa mengelola data fasilitas kesehatan (faskes), poli, layanan, dan alamat.
- **Pembayaran**: Menampilkan informasi billing dan validasi pembayaran.
- **Notifikasi**: Pengguna bisa menerima dan membaca notifikasi.
#### Fitur Mobile:
- **User**: Registrasi, login, dan mengelola profil pribadi.
- **Pembayaran**: Menampilkan tagihan dan melakukan pembayaran.
- **Notifikasi**: Pengguna bisa menerima dan membaca notifikasi.
- **Reservasi**: Mencari, booking, dan membatalkan reservasi.
  
### C4 Diagram
Context (C1)
![structurizr-1-SystemContext-001 (2)](https://github.com/user-attachments/assets/63979ef9-aa3e-48b6-861b-30c5e5b37afb)

Container (C2)
![structurizr-1-Container-001 (2)](https://github.com/user-attachments/assets/dfde0f22-7997-4bea-8892-914599aaaaba)

Componen (C3)
![c3 g](https://github.com/user-attachments/assets/0d26a9b7-adc9-471a-ae98-4d7ed12a43a2)

User story
-Super Admin
![user story super admin](https://github.com/user-attachments/assets/d3a3911f-9a65-43e9-b540-0f28d27c2317)

-Admin
![user story admin](https://github.com/user-attachments/assets/ce4ebaea-3ae1-429b-809f-5d18d8a6029c)

-Dokter
![user story doctor](https://github.com/user-attachments/assets/b74b61e2-e316-4c10-ac36-8033cc193fe1)

-Pasien
![user story pasien](https://github.com/user-attachments/assets/ca7028f8-a002-4470-80b9-73a390ff946e)

Code (C4)
![c4 gambar](https://github.com/user-attachments/assets/59250097-7bce-4da8-be63-29ecb09196db)
