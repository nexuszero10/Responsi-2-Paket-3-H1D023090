import 'package:flutter/material.dart';
import '../services/api_services.dart';

class TambahBuku extends StatefulWidget {
  const TambahBuku({super.key});

  @override
  State<TambahBuku> createState() => _TambahBukuState();
}

class _TambahBukuState extends State<TambahBuku> {
  final judul = TextEditingController();
  final harga = TextEditingController();
  final jumlah = TextEditingController();
  final tanggal = TextEditingController();
  final volume = TextEditingController();
  final penulis = TextEditingController();
  final penerbit = TextEditingController();

  void simpan() async {
    await ApiService.tambahBuku({
      "judul": judul.text,
      "harga": int.parse(harga.text),
      "jumlah": int.parse(jumlah.text),
      "tanggal_masuk": tanggal.text,
      "volume": int.parse(volume.text),
      "penulis": penulis.text,
      "penerbit": penerbit.text,
    });

    Navigator.pop(context);
  }

  Widget input(TextEditingController c, String label) {
    return TextField(controller: c, decoration: InputDecoration(labelText: label));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Inventaris TansahMart")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            input(judul, "Judul"),
            input(harga, "Harga"),
            input(jumlah, "Jumlah"),
            input(tanggal, "Tanggal Masuk"),
            input(volume, "Volume"),
            input(penulis, "Penulis"),
            input(penerbit, "Penerbit"),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: simpan, child: const Text("SIMPAN"))
          ],
        ),
      ),
    );
  }
}
