import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AkunPage extends StatefulWidget {
  @override
  _AkunPageState createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
  final _usernameController = TextEditingController();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  String currentUsername = "";

  @override
  void initState() {
    super.initState();
    fetchCurrentUser();
  }

  void fetchCurrentUser() async {
    // Contoh implementasi pengambilan data user dari API
    // Misalnya, bisa digunakan untuk menampilkan data user saat ini
    // Ganti bagian ini dengan logika pengambilan data user sesuai kebutuhan aplikasi Anda
    setState(() {
      currentUsername = "JohnDoe"; // Contoh pengaturan nama pengguna
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Akun'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                enabled: false, // Username tidak bisa diubah
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _oldPasswordController,
              decoration: InputDecoration(
                labelText: 'Password Lama',
              ),
              obscureText: true,
            ),
            TextFormField(
              controller: _newPasswordController,
              decoration: InputDecoration(
                labelText: 'Password Baru',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                updateAccount();
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }

  void updateAccount() async {
    final oldPassword = _oldPasswordController.text;
    final newPassword = _newPasswordController.text;

    // Validasi input
    if (oldPassword.isEmpty || newPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password lama dan baru harus diisi')),
      );
      return;
    }

    final response = await http.post(
      Uri.parse(
          'http://mobilecomputing.my.id/api_khalingga/update_account.php'),
      body: {
        'username': currentUsername,
        'old_password': oldPassword,
        'new_password': newPassword,
      },
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Akun berhasil diperbarui')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal memperbarui akun')),
      );
    }

    // Bersihkan input setelah update
    _oldPasswordController.clear();
    _newPasswordController.clear();
  }
}
