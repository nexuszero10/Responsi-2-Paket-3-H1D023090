import 'package:flutter/material.dart';
import '../services/api_services.dart';
import 'home_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();

  void doLogin() async {
    var response = await ApiService.login(email.text, password.text);

    if (response["token"] != null) {
      ApiService.token = response["token"];
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response["message"] ?? "Login gagal")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login TansahMart")),
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
                  Icon(Icons.storefront, size: 80, color: Colors.orange),
                  const SizedBox(height: 20),
                  const Text("TansahMart",
                      style: TextStyle(
                          fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF5D4037))),
                  const SizedBox(height: 28),
                  TextField(controller: email, decoration: const InputDecoration(labelText: "Email")),
                  const SizedBox(height: 14),
                  TextField(
                      controller: password,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: "Password")),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: doLogin, child: const Text("LOGIN")),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const RegisterPage()));
                    },
                    child: const Text("Belum punya akun? Daftar"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
