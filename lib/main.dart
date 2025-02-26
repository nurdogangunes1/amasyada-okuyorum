import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Firebase yapılandırma dosyan
import 'package:flutter/material.dart';
import 'home_screen.dart'; // Ana ekran

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase'i başlatırken FirebaseOptions'u kullan
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(), // Karanlık tema desteği
      home: const HomeScreen(), // HomeScreen'i burada kullanıyoruz
    );
  }
}
