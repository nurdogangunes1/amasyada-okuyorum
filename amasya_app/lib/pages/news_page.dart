import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:amasya_app/news_detail_page.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Haberler')),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('haberler').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('Henüz haber yok.'));
          }

          var haberler = snapshot.data!.docs;

          return ListView.builder(
            itemCount: haberler.length,
            itemBuilder: (context, index) {
              var haber = haberler[index];
              return Card(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Resim kısmı
                    Image.network(
                      haber['resimUrl'], // Firestore'daki resim URL'si
                      width: double.infinity,
                      height: 200, // Yükseklik ayarı
                      fit: BoxFit.cover, // Resmi düzgün şekilde uyarlamak için
                    ),
                    // Başlık kısmı
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        haber['baslik'],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow
                              .ellipsis, // Taşma durumunda ellipsis ekle
                        ),
                        maxLines: 2, // Başlık sadece iki satırda görünsün
                      ),
                    ),
                    // İçerik kısmı
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        haber['icerik'],
                        maxLines: 3, // İçerik sadece üç satırda görünsün
                        overflow: TextOverflow
                            .ellipsis, // Taşma durumunda ellipsis ekle
                      ),
                    ),
                    // Tıklama işlevi
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsDetailPage(haber: haber),
                          ),
                        );
                      },
                      child: Text('Devamını Oku'),
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
