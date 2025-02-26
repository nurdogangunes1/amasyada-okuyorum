import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:amasya_app/pages/news_page.dart';
import 'package:amasya_app/pages/activities_page.dart';
import 'pages/announcements_page.dart';
import 'pages/tenders_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isDarkTheme = false;
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    NewsPage(),
    ActivitiesPage(),
    AnnouncementsPage(),
    TendersPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isDarkTheme ? _darkTheme : _lightTheme,
      home: Scaffold(
        appBar: _buildAppBar(context),
        drawer: _buildDrawer(),
        bottomNavigationBar: _buildBottomNavigationBar(),
        body: _pages[_selectedIndex], // Seçilen sayfayı göster
      ),
    );
  }

  ThemeData get _lightTheme {
    return ThemeData(
      primarySwatch: Colors.blue,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  ThemeData get _darkTheme {
    return ThemeData(
      primarySwatch: Colors.blueGrey,
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        color: Colors.black,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.4),
      child: AppBar(
        flexibleSpace: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/bak.png',
                fit: BoxFit.fill,
              ),
            ),
            _buildAppBarButton(
              _isDarkTheme ? Icons.light_mode : Icons.dark_mode,
              40,
              MediaQuery.of(context).size.width - 50,
              () {
                setState(() {
                  _isDarkTheme = !_isDarkTheme;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBarButton(
      IconData icon, double top, double left, VoidCallback onPressed) {
    return Positioned(
      top: top,
      left: left,
      child: IconButton(
        icon: Icon(icon),
        onPressed: onPressed,
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Color.fromARGB(255, 142, 25, 7)),
            child: Text(
              'Menü',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          _buildExpansionTile('Rektörlük', [
            _buildDrawerButton('Rektör',
                'https://www.amasya.edu.tr/%C3%BCniversitemiz/yonetim/rektor'),
            _buildDrawerButton(
                'İç Denetim Birimi Başkanlığı', 'https://idb.amasya.edu.tr/'),
            _buildDrawerButton(
                'Kalite Koordinatörlüğü ', 'https://kalite.amasya.edu.tr/'),
            _buildDrawerButton('Rektör yardımcıları ',
                'https://www.amasya.edu.tr/universitemiz/yonetim/rektor-yardimcilari/'),
          ]),
          _buildExpansionTile('Fakülteler', [
            _buildDrawerButton(
                'Eğitim Fakültesi', 'https://egitim.amasya.edu.tr/'),
            _buildDrawerButton(
                'Fen Edebiyat Fakültesi', 'https://fenedebiyat.amasya.edu.tr/'),
            _buildDrawerButton('Hattat Hamdullah Güzel Sanatlar Fakültesi',
                'https://guzelsanatlar.amasya.edu.tr/'),
            _buildDrawerButton(
                'İlahiyat Fakültesi', 'https://ilahiyat.amasya.edu.tr/'),
            _buildDrawerButton(
                'Mühendislik Fakültesi', 'https://muhendislik.amasya.edu.tr/'),
            _buildDrawerButton(
                'Sağlık Bilimleri Fakültesi', 'https://sbf.amasya.edu.tr/'),
            _buildDrawerButton('Tıp Fakültesi ', 'https://tip.amasya.edu.tr/'),
          ]),
          _buildExpansionTile('Yemek Rezerve ', [
            _buildDrawerButton('Yemek', 'https://yemek.amasya.edu.tr/'),
          ]),
          _buildExpansionTile(
              'Kulüp ve Sosyal Transkript Bilgi Sistemi (KBS) ', [
            _buildDrawerButton('KBS GİRİŞ', 'https://kulupler.amasya.edu.tr/'),
          ]),
          _buildExpansionTile('Formlar/şemalar', [
            _buildDrawerButton('Formlar ve Şemalar',
                'https://kulupler.amasya.edu.tr/formlar%C5%9Femalar.aspx'),
          ]),
          _buildExpansionTile('Amasya AVM', [
            _buildDrawerButton(
                'Amasya AVM', 'https://www.amasyapark.com.tr/#/home'),
          ]),
          _buildExpansionTile('Müzeler', [
            _buildDrawerButton(
                'MÜZE VE ÖREN YERLERİ', 'https://amasya.bel.tr/muzelerimiz'),
          ]),
          _buildExpansionTile('E-KİTAP', [
            _buildDrawerButton(
                'E-KİTAP', 'https://amasya.bel.tr/amasya-tarihi'),
          ]),
          _buildExpansionTile('ETKİNLİKLER', [
            _buildDrawerButton(
                'ETKİNLİK TAKVİMİ', 'https://takvim.amasya.edu.tr/'),
          ]),
        ],
      ),
    );
  }

  Widget _buildExpansionTile(String title, List<Widget> children) {
    return ExpansionTile(
      title: Text(title),
      children: children,
    );
  }

  Widget _buildDrawerButton(String title, String url) {
    return ListTile(
      title: Text(title),
      onTap: () async {
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'URL açılamadı: $url';
        }
      },
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.newspaper),
          label: 'Haberler',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.celebration),
          label: 'Aktiviteler',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.campaign),
          label: 'Otobüs Saatleri',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.sell),
          label: 'İhaleler',
        ),
      ],
      selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.blue,
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }
}
