import 'package:flutter/material.dart';
import '../models/book.dart';
import '../services/book_service.dart';

class BookDetailScreen extends StatefulWidget {
  final Book book;

  const BookDetailScreen({Key? key, required this.book}) : super(key: key);

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  final BookService _bookService = BookService();
  late Future<String> _futureDescription;

  @override
  void initState() {
    super.initState();
    _futureDescription = _bookService.fetchBookDescription(widget.book.key);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Buku'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Cover Image Large
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  widget.book.coverUrl,
                  height: 220,
                  width: 150,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 220,
                    width: 150,
                    color: Colors.grey.shade300,
                    child: const Icon(Icons.book, size: 60, color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Title
            Text(
              widget.book.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            // Author
            Text(
              'Oleh: ${widget.book.authors.join(', ')}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.indigo.shade700,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),
            // Publish Year Badge
            Chip(
              backgroundColor: Colors.indigo.shade50,
              label: Text(
                'Tahun Terbit Pertama: ${widget.book.firstPublishYear ?? 'Tidak diketahui'}',
                style: TextStyle(color: Colors.indigo.shade900),
              ),
            ),
            const Divider(height: 32, thickness: 1),
            // Description Section
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Deskripsi / Ringkasan Buku',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            FutureBuilder<String>(
              future: _futureDescription,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (snapshot.hasError) {
                  return Text(
                    'Gagal memuat deskripsi: ${snapshot.error}',
                    style: const TextStyle(color: Colors.red),
                  );
                }
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Text(
                    snapshot.data ?? 'Tidak ada deskripsi.',
                    style: const TextStyle(fontSize: 15, height: 1.5, color: Colors.black87),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
