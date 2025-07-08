// home_buyer_page.dart
import 'package:flutter/material.dart';

class HomeBuyerPage extends StatelessWidget {
  const HomeBuyerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pembeli Home')),
      body: const Center(child: Text('Selamat datang, Pembeli')),
    );
  }
}
