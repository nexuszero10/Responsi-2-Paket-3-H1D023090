import 'package:flutter/material.dart';
import '../services/api_services.dart';

class EditBuku extends StatefulWidget {
  final Map data;

  const EditBuku({super.key, required this.data});

  @override
  State<EditBuku> createState() => _EditBukuState();
}

class _EditBukuState extends State<EditBuku> {
  final judul = TextEditingController();
  final harga = TextEditingController();
  final jumlah = TextEditingController();
  final tanggal = TextEditingController();
  final volume = TextEditingController();
  final penulis = TextEditingController();
  final penerbit = TextEditingController();

  @override
  void initState() {
    judul.text = widget.data['judul'];
    harga.text = widget.data['harga'].toString();
    jumlah.text = widget.data['jumlah'].toString();
    tanggal.text = widget.data['tanggal_masuk'];
    volume.text = widget.data['volume'].toString();
    penulis.text = widget.data['penulis'];
    penerbit.text = widget.data['penerbit'];
    super.initState();
  }

  void update() async {
    await ApiService.updateBuku(widget.data['id'], {
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
      appBar: AppBar(title: const Text("Edit Inventaris TansahMart")),
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
            ElevatedButton(onPressed: update, child: const Text("UPDATE"))
          ],
        ),
      ),
    );
  }
}
