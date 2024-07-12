import 'package:flutter/material.dart';

class KeranjangPage extends StatelessWidget {
  final List cartItems;

  KeranjangPage({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    // Hitung total harga
    int totalHarga = 0;
    for (var item in cartItems) {
      totalHarga +=
          int.parse(item['price'].replaceAll('Rp ', '').replaceAll('.', ''));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: cartItems[index]['image_url'] != null
                      ? Image.network(
                          cartItems[index]['image_url'],
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          width: 50,
                          height: 50,
                          color: Colors.grey[200],
                          child: Icon(Icons.image_not_supported),
                        ),
                  title: Text(cartItems[index]['name']),
                  subtitle: Text('Rp ${cartItems[index]['price']}'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Harga:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Rp $totalHarga',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/payment');
            },
            child: Text('Bayar'),
          ),
        ],
      ),
    );
  }
}
