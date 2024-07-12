import 'package:flutter/material.dart';
import 'home.dart';
import 'feed.dart';
import 'katalog.dart';
import 'feedback_form.dart';
import 'akun.dart';
import 'login.dart';
import 'register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bintanq Komputer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => HomePage(),
        '/feed': (context) => FeedPage(),
        '/katalog': (context) => KatalogPage(), // Panggil sebagai kelas
        '/feedback': (context) =>
            FeedbackFormPage(), // Panggil dengan nama kelas yang tepat
        '/akun': (context) => AkunPage(),
      },
    );
  }
}
