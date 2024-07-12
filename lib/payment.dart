import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PaymentPage extends StatefulWidget {
  final int totalHarga;
  final List cartItems;

  PaymentPage({required this.totalHarga, required this.cartItems});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  String _selectedExpedition = 'JNE'; // Default value

  void _processPayment() async {
    // Validasi input
    if (_nameController.text.isEmpty || _addressController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Nama dan Alamat harus diisi')),
      );
      return;
    }

    // Simpan data pembayaran ke database
    final response = await http.post(
      Uri.parse('http://mobilecomputing.my.id/api_khalingga/save_payment.php'),
      body: {
        'name': _nameController.text,
        'address': _addressController.text,
        'expedition': _selectedExpedition,
        'total_price': widget.totalHarga.toString(),
        'items': widget.cartItems.toString(),
      },
    );

    if (response.statusCode == 200) {
      // Proses berhasil
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Pembayaran berhasil')),
      );
    } else {
      // Proses gagal
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal menyimpan data pembayaran')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pembayaran'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Alamat'),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField(
              value: _selectedExpedition,
              onChanged: (value) {
                setState(() {
                  _selectedExpedition = value.toString();
                });
              },
              items: ['JNE', 'Tiki', 'POS Indonesia', 'Gojek', 'Grab']
                  .map((expedition) => DropdownMenuItem(
                        value: expedition,
                        child: Text(expedition),
                      ))
                  .toList(),
              decoration: InputDecoration(labelText: 'Jasa Ekspedisi'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _processPayment,
              child: Text('Bayar'),
            ),
          ],
        ),
      ),
    );
  }
}
