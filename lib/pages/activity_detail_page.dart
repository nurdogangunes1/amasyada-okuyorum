import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ActivityDetailPage extends StatelessWidget {
  final QueryDocumentSnapshot aktivite; // Aktiviteyi parametre olarak al

  const ActivityDetailPage({super.key, required this.aktivite}); // Constructor

  @override
  Widget build(BuildContext context) {
    // Firestore'dan gelen verileri güvenli şekilde alma
    String baslik = aktivite['baslik'] ?? 'Başlık Yok';
    String icerik = aktivite['icerik'] ?? 'İçerik bulunamadı.';
    String resimUrl = aktivite['resimUrl'] ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text(baslik), // Aktivitenin adı başlık olarak kullanıldı
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Aktivitenin görseli
            if (resimUrl.isNotEmpty)
              Image.network(
                resimUrl, // Firestore'dan gelen görsel URL'si
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.grey[300],
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.broken_image,
                      size: 50,
                      color: Colors.grey,
                    ),
                  );
                },
              )
            else
              Container(
                width: double.infinity,
                height: 200,
                color: Colors.grey[300],
                alignment: Alignment.center,
                child: const Icon(
                  Icons.image_not_supported,
                  size: 50,
                  color: Colors.grey,
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    baslik,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    icerik,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
