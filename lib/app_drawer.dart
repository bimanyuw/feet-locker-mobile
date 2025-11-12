import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              color: scheme.primary,
              padding: const EdgeInsets.all(16),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Feet Locker',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: .2,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Minimal. Monochrome. Match-ready.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white70,
                      letterSpacing: .2,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),

            ListTile(
              leading: const Icon(Icons.storefront_outlined),
              title: const Text('Halaman Utama'),
              onTap: () => Navigator.pushReplacementNamed(context, '/'),
            ),
            ListTile(
              leading: const Icon(Icons.add_box_outlined),
              title: const Text('Tambah Produk'),
              onTap: () => Navigator.pushReplacementNamed(context, '/add-product'),
            ),
          ],
        ),
      ),
    );
  }
}
