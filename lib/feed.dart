import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feed'),
      ),
      body: ListView(
        children: [
          _buildFeedItem(
            'Enterkomputer rilis PC rakitan EK Gaming',
            'Lini produk EK Gaming Battle Series menawarkan beragam spesifikasi yang mencakup berbagai kebutuhan, mulai dari perkantoran, sekolah, gaming berat, hingga professional editing/rendering..',
            'assets/artikel1.webp', // Path gambar artikel 1
          ),
          _buildFeedItem(
            'Lini produk EK Gaming Battle Series menawarkan beragam spesifikasi yang mencakup berbagai kebutuhan, mulai dari perkantoran, sekolah, gaming berat, hingga professional editing/rendering.',
            'EK Gaming Battle Series terdiri dari EK Office Fizzword, EK Gaming Battle Lionz, EK GAMING BATTLE LIONZ SR PC Gaming, dan EK GAMING BATTLE STAR RS-XS. Harganya terjangkau',
            'assets/artikel2.webp', // Path gambar artikel 2
          ),
          _buildFeedItem(
            'Intip Spesifikasi PC Rakitan Lokal EK Gaming Battle Series yang Dijual Mulai Harga Rp6 Jutaan',
            'Lebih lanjut disebut, EK GAMING BATTLE STAR RS-XS menjadi PC Rakitan untuk gaming berat serta professional editing rendering yang dibandrol Rp11 jutaan. Varian satu ini sebagai best seller di Enterkomputer.',
            'assets/artikel3.jpg', // Path gambar artikel 3
          ),
        ],
      ),
    );
  }

  Widget _buildFeedItem(String title, String subtitle, String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
