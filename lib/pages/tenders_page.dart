import 'package:flutter/material.dart';

class TendersPage extends StatelessWidget {
  const TendersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('İhaleler')),
      body: Center(
        child: Text(
          'İhaleler Sayfası',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
