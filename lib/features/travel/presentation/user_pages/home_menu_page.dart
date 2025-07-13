import 'package:flutter/material.dart';
import 'package:travelkita/features/travel/presentation/user_pages/home_page.dart';

class HomeMenuPage extends StatelessWidget {
  const HomeMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // gambar di belakang appbar juga
      appBar: AppBar(
        title: const Text('TravelKita'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/Travel.png',
              fit: BoxFit.cover,
            ),
          ),

          // Overlay content
          Container(
            padding: const EdgeInsets.fromLTRB(16, 100, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Selamat Datang di TravelKita!',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: Offset(1, 1),
                        blurRadius: 2,
                        color: Colors.black54,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Temukan dan pesan travel antar kota dengan mudah dan nyaman.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: Offset(0.5, 0.5),
                        blurRadius: 2,
                        color: Colors.black54,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // Menu Grid
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    padding: const EdgeInsets.all(8),
                    children: [
                      _buildMenuTile(
                          context, Icons.directions_bus, 'Lihat Jadwal', '/home'),
                      _buildMenuTile(
                          context, Icons.history, 'Riwayat', '/riwayat'),
                      _buildMenuTile(
                          context, Icons.notifications, 'Notifikasi', '/notifikasi'),
                      _buildMenuTile(
                          context, Icons.person, 'Profil Saya', '/profil'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuTile(BuildContext context, IconData icon, String label, String route) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.85),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(2, 2),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            const SizedBox(height: 8),
            Text(label, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
