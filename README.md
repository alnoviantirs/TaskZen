# 📅 TaskZen - Aplikasi Pengingat Tugas Mobile 📅

Selamat datang di **TaskZen**! Aplikasi mobile ini dirancang untuk membantu Anda mengelola dan mengingat tugas-tugas harian dengan mudah dan efisien. TaskZen menggabungkan pengembangan aplikasi seluler menggunakan Flutter dengan backend yang kuat menggunakan Golang dan MongoDB. Aplikasi ini bertujuan memberikan solusi inovatif dan efisien bagi pengguna dalam mengatur tugas-tugas mereka.

## ✨ Fitur Utama

- **Pengingat Tugas**: Buat, baca, perbarui, dan hapus pengingat tugas dengan mudah.
- **Notifikasi**: Dapatkan notifikasi tepat waktu untuk setiap tugas yang sudah diatur.
- **Prioritas Tugas**: Atur prioritas pada tugas-tugas penting agar Anda tetap fokus pada hal yang penting.
- **Sinkronisasi Cloud**: Semua data tugas Anda disimpan dan disinkronisasi di cloud.

## 🛠️ Teknologi yang Digunakan

- **Frontend**: Flutter
- **Backend**: Golang
- **Database**: MongoDB
- **Hosting**: Heroku

## 🚀 Instalasi

Ikuti langkah-langkah berikut untuk menginstal dan menjalankan aplikasi TaskZen di lokal Anda:

### Backend

1. **Clone Repository**

   ```bash
   git clone https://github.com/username/taskzen.git
   ```

2. **Masuk ke Direktori Proyek**

git clone folder backend 'https://github.com/alnoviantirs/be_catatan.git'

```bash
cd taskzen/backend
```

3. **Instalasi Dependensi**

   ```bash
   go mod download
   ```

4. **Konfigurasi Lingkungan**

   - Buat file `.env` dan sesuaikan konfigurasi yang diperlukan

   ```env
   MONGODB_URI=mongodb+srv://username:password@cluster0.mongodb.net/taskzen
   PORT=8080
   ```

5. **Menjalankan Server**
   ```bash
   go run main.go
   ```

### Frontend

1. **Masuk ke Direktori Frontend**

   ```bash
   cd ../frontend
   ```

2. **Instalasi Dependensi**

   ```bash
   flutter pub get
   ```

3. **Menjalankan Aplikasi**
   ```bash
   flutter run
   ```

## 🌐 Cara Menggunakan

1. **Buat Akun**: Daftar untuk akun baru atau masuk jika Anda sudah memiliki akun.
2. **Tambahkan Tugas**: Tambahkan tugas baru dengan menetapkan judul, deskripsi, tanggal, dan prioritas.
3. **Dapatkan Notifikasi**: Terima notifikasi ketika waktu pengingat tugas mendekat.
4. **Kelola Tugas**: Edit atau hapus tugas sesuai kebutuhan Anda.

## 🎉 Terima Kasih!

Terima kasih telah menggunakan TaskZen! Kami berharap aplikasi ini dapat membantu Anda mengelola tugas-tugas harian dengan lebih mudah dan efisien.
