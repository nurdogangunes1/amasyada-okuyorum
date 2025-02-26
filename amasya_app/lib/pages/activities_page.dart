import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:amasya_app/pages/activity_detail_page.dart';

class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aktiviteler')),
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('aktiviteler').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('Henüz aktivite yok.'));
          }

          var aktiviteler = snapshot.data!.docs;

          return ListView.builder(
            itemCount: aktiviteler.length,
            itemBuilder: (context, index) {
              var aktivite = aktiviteler[index];
              String resimUrl = aktivite['resimUrl'] ?? '';

              return Card(
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Resim kısmı
                    if (resimUrl.isNotEmpty)
                      Image.network(
                        resimUrl,
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
                    // Başlık kısmı
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        aktivite['baslik'] ?? 'Başlık Yok',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 2,
                      ),
                    ),
                    // İçerik kısmı
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        aktivite['icerik'] ?? 'İçerik bulunamadı.',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // Tıklama işlevi
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ActivityDetailPage(aktivite: aktivite),
                          ),
                        );
                      },
                      child: const Text('Devamını Oku'),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
