import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  void _performSearch(String query) {
    if (query.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Masukkan kata kunci pencarian buku terlebih dahulu!')),
      );
      return;
    }
    Navigator.pushNamed(
      context,
      '/results',
      arguments: query.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> popularCategories = [
      'Flutter',
      'Programming',
      'Harry Potter',
      'Artificial Intelligence',
      'Mathematics',
      'History',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('BookFinder App'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner / Header Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.indigo, Colors.blueAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Temukan Buku Favoritmu 📚',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Jelajahi jutaan koleksi buku dari Open Library API secara instan dan gratis.',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Search Input Section
            const Text(
              'Cari Buku Berdasarkan Judul/Topik',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Contoh: Clean Code, Flutter...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                    onSubmitted: (value) => _performSearch(value),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () => _performSearch(_searchController.text),
                  child: const Text('Cari', style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
            const SizedBox(height: 30),
            // Popular Topics / Quick Search
            const Text(
              'Pencarian Populer',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: popularCategories.map((category) {
                return ActionChip(
                  label: Text(category),
                  backgroundColor: Colors.indigo.shade50,
                  labelStyle: TextStyle(color: Colors.indigo.shade800),
                  onPressed: () {
                    _searchController.text = category;
                    _performSearch(category);
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
