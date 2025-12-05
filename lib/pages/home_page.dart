import 'package:flutter/material.dart';
import '../services/api_services.dart';
import 'tambah_buku.dart';
import 'edit_buku.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List buku = [];

  void loadData() async {
    buku = await ApiService.getBuku();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Inventaris Buku TansahMart")),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF8D6E63),
        onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const TambahBuku()))
            .then((_) => loadData()),
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: buku.length,
        itemBuilder: (_, i) {
          var item = buku[i];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: ListTile(
              title: Text(item['judul']),
              subtitle: Text("Penulis: ${item['penulis']} | Harga: ${item['harga']}"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => EditBuku(data: item)),
                        ).then((_) => loadData());
                      }),
                  IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () async {
                        await ApiService.deleteBuku(item['id']);
                        loadData();
                      }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
