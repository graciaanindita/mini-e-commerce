import 'package:flutter/material.dart';

void main() {
  runApp(const LayoutingDasar());
}

class LayoutingDasar extends StatelessWidget {
  const LayoutingDasar({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Widget Flutter",
      home: MainNavigationPage(),
    );
  }
}

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _selectedIndex = 0;

  //daftar 3 halaman utama
  final List<Widget> _pages = [
    const ProfileCardPage(),
    const JadwalPage(),
    const PengaturanPage(),
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
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Siswa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Jadwal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Pengaturan',
          ),
        ],
      )
    );
  }
}
class PengaturanPage extends StatelessWidget {
  const PengaturanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pengaturan")),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.settings, size: 100, color: Colors.deepPurple),
            SizedBox(height: 12),
            Text('Halaman Pengaturan', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

class ProfileCardPage extends StatefulWidget {
  const ProfileCardPage({super.key});

  @override
  State<ProfileCardPage> createState() => _ProfileCardPageState();
}

class _ProfileCardPageState extends State<ProfileCardPage> {
  bool isFavorite1 = false;
  bool isFavorite2 = false;

  void toogleFavorite1() {
    setState(() {
      isFavorite1 = !isFavorite1;
    });
  }

  void toogleFavorite2() {
    setState(() {
      isFavorite2 = !isFavorite2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kartu Profile Siswa")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ProfileCard(
                  nama: "Gracia Anindita",
                  kelas: "Siswa dari kelas XI RPL 7",
                  email: "cici@gmail.com",
                  notifCount: 3,
                  isFavorite: isFavorite1,
                  onFavoriteTap: toogleFavorite1,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ProfileCard(
                  nama: "Clarisya Aura",
                  kelas: "Siswa dari kelas XI RPL 5",
                  email: "aura@gmail.com",
                  notifCount: 12,
                  isFavorite: isFavorite2,
                  onFavoriteTap: toogleFavorite2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String nama;
  final String kelas;
  final String email;
  final int notifCount;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;

  const ProfileCard({
    super.key,
    required this.nama,
    required this.kelas,
    required this.email,
    required this.notifCount,
    required this.isFavorite,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailProfilePage(nama: nama, kelas: kelas),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.teal.shade50,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.deepPurple.shade50),
                  child: const Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  nama,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(kelas, textAlign: TextAlign.center),
                Text(email, textAlign: TextAlign.center),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: onFavoriteTap,
                        child: Text(
                          isFavorite ? 'Hapus Favorit' : 'Tambah Favorit',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Icon favorite di pojok kanan atas
            Positioned(
              top: 0,
              right: 0,
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
              ),
            ),
            // Badge notifikasi di pojok kiri atas
            Positioned(
              top: -8,
              left: -8,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                constraints: const BoxConstraints(minWidth: 24, minHeight: 24),
                child: Text(
                  '$notifCount',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailProfilePage extends StatelessWidget {
  final String nama;
  final String kelas;

  const DetailProfilePage({super.key, required this.nama, required this.kelas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Profile")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.deepPurple,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 16),
            Text(
              nama,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              kelas,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
class JadwalPage extends StatelessWidget {
  const JadwalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Jadwal")),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.calendar_month, size: 100, color: Colors.deepPurple),
            SizedBox(height: 12),
            Text('Halaman Jadwal', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
} 