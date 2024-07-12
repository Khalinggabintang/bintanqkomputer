import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'keranjang.dart'; // Import halaman keranjang

class KatalogPage extends StatefulWidget {
  @override
  _KatalogPageState createState() => _KatalogPageState();
}

class _KatalogPageState extends State<KatalogPage> {
  List items = [];
  String searchQuery = "";
  List cartItems = []; // List untuk menyimpan item di keranjang

  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  void fetchItems() async {
    final response = await http.get(
        Uri.parse('http://mobilecomputing.my.id/api_khalingga/get_items.php'));
    final data = json.decode(response.body);

    setState(() {
      items = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Katalog'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Cari Item',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                if (searchQuery.isEmpty ||
                    items[index]['name']
                        .toLowerCase()
                        .contains(searchQuery.toLowerCase())) {
                  return ListTile(
                    leading: items[index]['image_url'] != null
                        ? Image.network(
                            items[index]['image_url'],
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          )
                        : null,
                    title: Text(items[index]['name']),
                    subtitle: Text('Rp ${items[index]['price']}'),
                    trailing: IconButton(
                      icon: Icon(Icons.add_shopping_cart),
                      onPressed: () {
                        addItemToCart(items[index]);
                      },
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Pindahkan ke halaman keranjang
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => KeranjangPage(cartItems: cartItems),
            ),
          );
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(Icons.shopping_cart),
            if (cartItems.isNotEmpty)
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 18,
                    minHeight: 18,
                  ),
                  child: Text(
                    '${cartItems.length}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void addItemToCart(item) {
    setState(() {
      cartItems.add(item);
    });
    print('Item added to cart: ${item['name']}');
  }
}
