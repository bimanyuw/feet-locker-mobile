import 'package:flutter/material.dart';
import 'package:feet_locker/widgets/app_drawer.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  int _price = 0;
  String _description = '';
  String _imageUrl = '';
  String _category = 'Jersey';
  int _stock = 0;
  bool _isFeatured = false;

  final List<String> _categories = [
    'Jersey',
    'Sepatu',
    'Bola',
    'Aksesoris',
    'Lainnya',
  ];

  bool _isValidUrl(String value) {
    return value.startsWith('http://') || value.startsWith('https://');
  }

  void _showSummaryDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Produk Berhasil Dibuat'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nama       : $_name'),
              Text('Harga      : Rp$_price'),
              Text('Deskripsi  : $_description'),
              Text('Kategori   : $_category'),
              Text('Stok       : $_stock'),
              Text('Thumbnail  : $_imageUrl'),
              Text('Unggulan   : ${_isFeatured ? "Ya" : "Tidak"}'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Edit Lagi'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
              _formKey.currentState!.reset();
              setState(() {
                _name = '';
                _price = 0;
                _description = '';
                _imageUrl = '';
                _category = 'Jersey';
                _stock = 0;
                _isFeatured = false;
              });
            },
            child: const Text('Selesai'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Produk Baru'),
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Form Produk Feet Locker',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: scheme.onBackground,
                    ),
                  ),
                  const SizedBox(height: 16),

                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Nama Produk',
                      hintText: 'Contoh: Nike Mercurial Vapor 15',
                    ),
                    onChanged: (value) => _name = value.trim(),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Nama produk tidak boleh kosong.';
                      }
                      if (value.trim().length < 3) {
                        return 'Nama minimal 3 karakter.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),

                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Harga (Rp)',
                      hintText: 'Contoh: 1299000',
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      _price = int.tryParse(value) ?? 0;
                    },
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Harga tidak boleh kosong.';
                      }
                      final parsed = int.tryParse(value);
                      if (parsed == null) {
                        return 'Harga harus berupa angka.';
                      }
                      if (parsed <= 0) {
                        return 'Harga harus lebih dari 0.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),

                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Stok',
                      hintText: 'Contoh: 10',
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      _stock = int.tryParse(value) ?? 0;
                    },
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Stok tidak boleh kosong.';
                      }
                      final parsed = int.tryParse(value);
                      if (parsed == null) {
                        return 'Stok harus berupa angka.';
                      }
                      if (parsed < 0) {
                        return 'Stok tidak boleh negatif.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),

                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Deskripsi',
                      hintText: 'Minimal 10 karakter.',
                    ),
                    maxLines: 3,
                    onChanged: (value) => _description = value.trim(),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Deskripsi tidak boleh kosong.';
                      }
                      if (value.trim().length < 10) {
                        return 'Deskripsi minimal 10 karakter.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),

                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Kategori',
                    ),
                    value: _category,
                    items: _categories
                        .map(
                          (c) => DropdownMenuItem(
                            value: c,
                            child: Text(c),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() => _category = value);
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Kategori harus dipilih.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),

                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Thumbnail URL',
                      hintText: 'https://contoh.com/produk.jpg',
                    ),
                    onChanged: (value) => _imageUrl = value.trim(),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Thumbnail tidak boleh kosong.';
                      }
                      if (!_isValidUrl(value.trim())) {
                        return 'Masukkan URL yang valid (http/https).';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),

                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Tandai sebagai produk unggulan'),
                    value: _isFeatured,
                    onChanged: (val) {
                      setState(() => _isFeatured = val);
                    },
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _showSummaryDialog();
                        }
                      },
                      child: const Text('Save'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
