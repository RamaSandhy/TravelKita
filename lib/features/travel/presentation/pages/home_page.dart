import 'package:flutter/material.dart';
import 'search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    WelcomePage(),
    SearchPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Cari',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Travel.png',
              height: 200,
              errorBuilder: (_, __, ___) => const Icon(Icons.image_not_supported),
            ),
            const SizedBox(height: 20),
            const Text(
              'Ayo Travel bersama Kita!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Selamat datang di TravelKita, cara baru memesan tiket travel secara praktis dan efisien.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Mulai'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tentang')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/gunung.png',
                errorBuilder: (_, __, ___) => const Icon(Icons.image_not_supported),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Tentang',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'TravelKita adalah aplikasi yang membantu Anda memesan tiket travel antar kota secara mudah dan cepat.',
            ),
            const SizedBox(height: 24),
            const Text(
              'Persiapan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Column(
                  children: [
                    Icon(Icons.calendar_month, size: 32),
                    SizedBox(height: 4),
                    Text('Reservasi')
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.map, size: 32),
                    SizedBox(height: 4),
                    Text('Rencana')
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.check_circle_outline, size: 32),
                    SizedBox(height: 4),
                    Text('Berita')
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}