import 'package:flutter/material.dart';
import '../models/book.dart';
import '../services/open_library_service.dart';
import '../widgets/book_cover.dart';

class BookDetailsPage extends StatefulWidget {
  final Book book;

  const BookDetailsPage({Key? key, required this.book}) : super(key: key);

  @override
  State<BookDetailsPage> createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  final OpenLibraryService _bookService = OpenLibraryService();
  late Future<String> _futureDescription;

  @override
  void initState() {
    super.initState();
    _futureDescription = _bookService.fetchBookDescription(widget.book.key);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF7F0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAF7F0),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF6B4226)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Book Details',
          style: TextStyle(
            color: Color(0xFF292521),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Large Book Cover
            Center(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Hero(
                  tag: 'book_cover_${widget.book.key}',
                  child: BookCover(
                    coverUrl: widget.book.coverUrl,
                    width: 140,
                    height: 200,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Title
            Text(
              widget.book.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF292521),
              ),
            ),
            const SizedBox(height: 8),
            // Author
            Text(
              'By ${widget.book.authors.join(', ')}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF6B4226),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 14),
            // First Publish Year Badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFEAE3D8)),
              ),
              child: Text(
                'First Published: ${widget.book.firstPublishYear ?? 'N/A'}',
                style: const TextStyle(
                  color: Color(0xFFD99A55),
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Divider(color: Color(0xFFEAE3D8), thickness: 1),
            const SizedBox(height: 16),
            // About This Book Section
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'About This Book',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF292521),
                ),
              ),
            ),
            const SizedBox(height: 12),
            FutureBuilder<String>(
              future: _futureDescription,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Center(
                      child: CircularProgressIndicator(color: Color(0xFF6B4226)),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text(
                    'Failed to load description.',
                    style: TextStyle(color: Colors.red.shade700),
                  );
                }
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFEAE3D8)),
                  ),
                  child: Text(
                    snapshot.data ?? 'No description available.',
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.6,
                      color: Color(0xFF292521),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
            // Search Another Book Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF6B4226),
                  side: const BorderSide(color: Color(0xFF6B4226)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Back to Search Results',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
