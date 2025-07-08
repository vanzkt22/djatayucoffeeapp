import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EditProductPage extends StatefulWidget {
  final Map<String, dynamic> product;

  const EditProductPage({super.key, required this.product});

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  final supabase = Supabase.instance.client;
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  final imageUrlController = TextEditingController();
  final categoryController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    final p = widget.product;
    nameController.text = p['name'] ?? '';
    priceController.text = p['price'].toString();
    descriptionController.text = p['description'] ?? '';
    imageUrlController.text = p['image_url'] ?? '';
    categoryController.text = p['category'] ?? '';
  }

  Future<void> updateProduct() async {
    setState(() => isLoading = true);
    try {
      await supabase.from('products').update({
        'name': nameController.text,
        'price': int.tryParse(priceController.text) ?? 0,
        'description': descriptionController.text,
        'image_url': imageUrlController.text,
        'category': categoryController.text
      }).eq('id', widget.product['id']);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Produk berhasil diperbarui')),
      );
      Navigator.pop(context, true);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal memperbarui produk: $e')),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Produk')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Nama Produk'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Harga'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Deskripsi'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: imageUrlController,
              decoration: const InputDecoration(labelText: 'URL Gambar'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: categoryController,
              decoration: const InputDecoration(labelText: 'Kategori (arabica/robusta/mix)'),
            ),
            const SizedBox(height: 20),
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : ElevatedButton(
                    onPressed: updateProduct,
                    child: const Text('Simpan Perubahan'),
                  ),
          ],
        ),
      ),
    );
  }
}
