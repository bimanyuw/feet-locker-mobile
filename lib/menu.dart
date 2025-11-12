import 'package:flutter/material.dart';
import 'package:feet_locker/app_drawer.dart';
import 'package:feet_locker/add_product_page.dart';

class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;        
  final String snackMessage;

  ItemHomepage({
    required this.name,
    required this.icon,
    required this.color,
    required this.snackMessage,
  });
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          if (item.name == "Create Product") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddProductPage(),
              ),
            );
          } else {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(content: Text(item.snackMessage)),
              );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item.icon, color: Colors.white, size: 30.0),
                const SizedBox(height: 8),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final String nama = "Febrian Abimanyu Wijanarko";
  final String npm = "2406397984";
  final String kelas = "PBP - Ganjil 25/26";

  final List<ItemHomepage> items = [
    ItemHomepage(
      name: "All Products",
      icon: Icons.sports_soccer,
      color: Colors.black,          
      snackMessage: "Kamu telah menekan tombol All Products",
    ),
    ItemHomepage(
      name: "My Products",
      icon: Icons.inventory_2,
      color: Colors.black87,      
      snackMessage: "Kamu telah menekan tombol My Products",
    ),
    ItemHomepage(
      name: "Create Product",
      icon: Icons.add_box,
      color: Colors.black54,       
      snackMessage: "Menuju halaman tambah produk baru",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Feet Locker',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: nama),
                InfoCard(title: 'Class', content: kelas),
              ],
            ),
            const SizedBox(height: 16.0),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Selamat datang di Feet Locker',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                  color: scheme.onBackground,
                ),
              ),
            ),
            const SizedBox(height: 12.0),

            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.all(12),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                children: items.map((item) => ItemCard(item)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
