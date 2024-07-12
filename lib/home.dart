import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imgList = [
    'assets/banner1.jpg',
    'assets/banner2.jpg',
    'assets/banner3.jpg',
    'assets/banner4.jpg',
  ];

  final List<Map<String, dynamic>> itemList = [
    {
      'image': 'assets/item1.jpg',
      'name': '1STPLAYER GAMING CHAIR FD-GC1 -',
      'price': 'Rp1.950.000',
    },
    {
      'image': 'assets/item2.jpg',
      'name': '1STPLAYER GAMING CHAIR K2 - BLACK ',
      'price': 'Rp1.950.000',
    },
    {
      'image': 'assets/item3.jpg',
      'name': '1STPLAYER GAMING CHAIR DK2 PRO - GRAY ORANGE ',
      'price': 'Rp2.650.000',
    },
    {
      'image': 'assets/item4.jpg',
      'name': '1STPLAYER GAMING CHAIR FD-GC1',
      'price': 'Rp1.950.000',
    },
    {
      'image': 'assets/item5.jpg',
      'name': '1STPLAYER GAMING CHAIR DK2 PRO - GRAY ORANGE',
      'price': 'Rp1.950.000',
    },
    {
      'image': 'assets/item6.jpg',
      'name': '1STPLAYER GAMING CHAIR K2 - BLACK',
      'price': 'Rp1.950.000',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            color: Colors.lightGreen,
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Colors.lightGreen,
                  elevation: 0,
                  title: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 40,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              filled: true,
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.notifications),
                        onPressed: () {
                          // Handle notification button press
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.favorite),
                        onPressed: () {
                          // Handle wishlist button press
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5), // Add padding above the carousel images
                CarouselSlider(
                  options: CarouselOptions(
                    height: 115.0, // Adjusted height to match 5px padding
                    autoPlay: false,
                    aspectRatio: 16 / 9,
                    enlargeCenterPage: true,
                  ),
                  items: imgList
                      .map((item) => Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Stack(
                                children: <Widget>[
                                  Image.asset(item,
                                      fit: BoxFit.cover, width: 1000),
                                  Positioned(
                                    bottom: 0.0,
                                    left: 0.0,
                                    right: 0.0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color.fromARGB(200, 0, 0, 0),
                                            Color.fromARGB(0, 0, 0, 0)
                                          ],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Image.asset('assets/banner5.jpg'),
                SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: itemList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: Image.asset(
                            itemList[index]['image'],
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                          title: Text(itemList[index]['name']),
                          subtitle: Text(itemList[index]['price']),
                        ),
                        Divider(), // Optional: Add a divider between items
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightGreen,
        selectedItemColor: Colors.black26,
        unselectedItemColor: Colors.black54,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Katalog',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feedback),
            label: 'Feedback',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Akun',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/feed');
              break;
            case 2:
              Navigator.pushNamed(context, '/katalog');
              break;
            case 3:
              Navigator.pushNamed(context, '/feedback');
              break;
            case 4:
              Navigator.pushNamed(context, '/akun');
              break;
          }
        },
      ),
    );
  }
}
