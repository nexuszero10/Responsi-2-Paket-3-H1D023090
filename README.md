# Responsi 2 Paket 3 - Inventaris Buku

## Nama : Tansah Jumeneng Prayogi
## NIM : H1D020390
## Shift : G -> F

---

## Demo Aplikasi
![responsi 2_paket 3_H1D023090_F_G](https://github.com/user-attachments/assets/661784af-0b5c-4ff8-ad9d-a0a2fdcc6897)

## Spesifikasi API

Aplikasi backend menggunakan **Node.js + MySQL** dengan endpoint sebagai berikut:

- **POST /auth/register** : Registrasi user baru, body `{name, email, password}`
- **POST /auth/login** : Login user, body `{email, password}`. Response berisi `token`
- **GET /buku** : Ambil semua daftar buku (membutuhkan token)
- **POST /buku** : Tambah buku baru, body `{judul, harga, jumlah, tanggal_masuk, volume, penulis, penerbit}`
- **GET /buku/:id** : Ambil detail buku berdasarkan ID
- **PUT /buku/:id** : Update data buku berdasarkan ID, body sama seperti POST
- **DELETE /buku/:id** : Hapus buku berdasarkan ID

> Semua endpoint `/buku` membutuhkan header: `Authorization: Bearer <token>`

---

## CRUD + Login Flutter

Aplikasi Flutter menyediakan halaman dan fungsionalitas berikut:

- **LoginPage** : Input email dan password, function `doLogin()`, navigasi ke `HomePage` jika sukses
- **RegisterPage** : Input name, email, password, function `doRegister()`, menampilkan SnackBar konfirmasi registrasi
- **HomePage** : Menampilkan daftar buku, tombol `+` untuk tambah buku (`TambahBuku`), tombol edit (`EditBuku`) dan delete buku
- **TambahBuku** : Input lengkap data buku, function `simpan()`, memanggil `ApiService.tambahBuku(data)` dan kembali ke `HomePage`
- **EditBuku** : Input diisi otomatis dari data buku, function `update()`, memanggil `ApiService.updateBuku(id, data)` dan kembali ke `HomePage`

---

## Cara Run

### Backend Node.js
```bash
cd api-inventaris-node
npm install
node server.js
