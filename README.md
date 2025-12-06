# Responsi 2 Paket 3 - Inventaris Buku

## Nama : Tansah Jumeneng Prayogi
## NIM : H1D020390
## Shift : G -> F

---

## Demo Aplikasi
![responsi 2_paket 3_H1D023090_F_G](https://github.com/user-attachments/assets/661784af-0b5c-4ff8-ad9d-a0a2fdcc6897)

## Spesifikasi API

Aplikasi backend menggunakan **Node.js + MySQL** dengan endpoint sebagai berikut:
- Repository : https://github.com/nexuszero10/inventaris_buku_api

- **POST /auth/register** : Registrasi user baru, body `{name, email, password}`
  <img width="2032" height="1142" alt="register-postman" src="https://github.com/user-attachments/assets/cf344d11-c1e4-4f23-bf5c-08a47196d64d" />
  
- **POST /auth/login** : Login user, body `{email, password}`. Response berisi `token`
  <img width="2032" height="1230" alt="login-postman" src="https://github.com/user-attachments/assets/646cdb2f-1e43-44bb-ad58-b0a4f0b99da3" />

- **GET /buku** : Ambil semua daftar buku (membutuhkan token)
  <img width="2032" height="1454" alt="image" src="https://github.com/user-attachments/assets/7b818c77-a15c-440a-952a-3f33147a3a94" />

- **POST /buku** : Tambah buku baru, body `{judul, harga, jumlah, tanggal_masuk, volume, penulis, penerbit}`
  <img width="2030" height="1142" alt="create-buku-postman" src="https://github.com/user-attachments/assets/672038dd-6a27-468e-b8dc-2c87eb780c6e" />

- **GET /buku/:id** : Ambil detail buku berdasarkan ID
  <img width="2022" height="1348" alt="read-detail-postman" src="https://github.com/user-attachments/assets/5bfec34b-919b-462e-af34-6fca7e738fcb" />

- **PUT /buku/:id** : Update data buku berdasarkan ID, body sama seperti POST
  <img width="2026" height="1160" alt="update-buku-postman" src="https://github.com/user-attachments/assets/5f5c5227-307e-40fd-ad6e-b0a3e93a5597" />

- **DELETE /buku/:id** : Hapus buku berdasarkan ID
  <img width="2030" height="1118" alt="delete-buku-postman" src="https://github.com/user-attachments/assets/a0e1e295-abf0-4b08-9214-6a6b60f7576a" />


> Semua endpoint `/buku` membutuhkan header: `Authorization: Bearer <token>`

---

## CRUD + Login Flutter

Aplikasi Flutter menyediakan halaman dan fungsionalitas berikut:

- **LoginPage** : Input email dan password, function `doLogin()`, navigasi ke `HomePage` jika sukses
  <img width="800" height="1318" alt="image" src="https://github.com/user-attachments/assets/45612fd4-9b0a-4319-b78c-204e49ba63fe" />

- **RegisterPage** : Input name, email, password, function `doRegister()`, menampilkan SnackBar konfirmasi registrasi
  <img width="810" height="1332" alt="image" src="https://github.com/user-attachments/assets/848b8ec5-20a9-420c-9a8e-f3d6f170bdc3" />

- **HomePage** : Menampilkan daftar buku, tombol `+` untuk tambah buku (`TambahBuku`), tombol edit (`EditBuku`) dan delete buku
  <img width="818" height="1320" alt="image" src="https://github.com/user-attachments/assets/d92a9acd-ff62-4283-9b35-ebf7bb674feb" />

- **TambahBuku** : Input lengkap data buku, function `simpan()`, memanggil `ApiService.tambahBuku(data)` dan kembali ke `HomePage`
  <img width="800" height="1316" alt="image" src="https://github.com/user-attachments/assets/540852cc-1e5d-4aba-9a68-393b1a46659f" />

- **EditBuku** : Input diisi otomatis dari data buku, function `update()`, memanggil `ApiService.updateBuku(id, data)` dan kembali ke `HomePage`
  <img width="826" height="1312" alt="image" src="https://github.com/user-attachments/assets/ffef3cdf-263c-46cb-aeab-e33c35c87d63" />

---
