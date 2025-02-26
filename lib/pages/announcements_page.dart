import 'package:flutter/material.dart';

class AnnouncementsPage extends StatelessWidget {
  const AnnouncementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Otobüs Saatleri')),
      body: SingleChildScrollView(
        // Kaydırılabilir alan
        child: Column(
          children: [
            Image.asset(
              'assets/images/otobus.jpg', // Kaydırılabilir resim
              width: double.infinity, // Resmi tam genişlikte gösterir
              fit: BoxFit.cover, // Resmin boyutlandırma şekli
            ),
            // Burada eklemek istediğiniz diğer içerikler olabilir
          ],
        ),
      ),
    );
  }
}
