import 'package:flutter/material.dart';
import 'package:feet_locker/models/product.dart';
import 'package:feet_locker/utils/constants.dart';
import 'package:feet_locker/widgets/app_drawer.dart';
import 'package:feet_locker/widgets/product_card.dart';
import 'package:feet_locker/screens/product_detail_page.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  Future<List<Product>> fetchProducts(CookieRequest request) async {
    final response = await request.get(productsJsonUrl);
    final List<Product> products = [];
    for (final item in response) {
      products.add(Product.fromJson(item));
    }
    return products;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Produk')),
      drawer: const AppDrawer(),
      body: FutureBuilder<List<Product>>(
        future: fetchProducts(request),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Belum ada produk.'));
          }
          final products = snapshot.data!;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final p = products[index];
              return ProductCard(
                product: p,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductDetailPage(product: p),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
