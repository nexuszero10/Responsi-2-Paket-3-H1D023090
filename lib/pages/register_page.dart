import 'package:flutter/material.dart';
import '../services/api_services.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  void doRegister() async {
    var response = await ApiService.register(name.text, email.text, password.text);

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response["message"] ?? "Registrasi gagal")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register TansahMart")),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  TextField(controller: name, decoration: const InputDecoration(labelText: "Nama")),
                  const SizedBox(height: 14),
                  TextField(controller: email, decoration: const InputDecoration(labelText: "Email")),
                  const SizedBox(height: 14),
                  TextField(
                      controller: password,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: "Password")),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: doRegister, child: const Text("REGISTER")),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
