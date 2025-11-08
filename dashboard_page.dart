import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  Widget _menuItem(BuildContext context, IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 34),
            const SizedBox(height: 8),
            Text(label),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const String userName = 'Rizqi Dian Saputra';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi Mahasiswa'),
        actions: [
          IconButton(
            onPressed: () {
              // simple placeholder action
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Notifikasi tidak ada')));
            },
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // header
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Halo,', style: TextStyle(color: Colors.black54)),
                      const SizedBox(height: 4),
                      Text(userName, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: AssetImage('assets/avatar.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // banner
            Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                  image: AssetImage('assets/avatar.png'),
                  fit: BoxFit.cover,
                  opacity: 0.25,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // menu grid (3 items)
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _menuItem(context, Icons.person, 'Profil', () {
                  Navigator.pushNamed(context, '/profile');
                }),
                _menuItem(context, Icons.list, 'Data', () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Menu Data belum diimplementasikan')));
                }),
                _menuItem(context, Icons.settings, 'Pengaturan', () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Pengaturan belum diimplementasikan')));
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
