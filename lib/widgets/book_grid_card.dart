import 'package:flutter/material.dart';
import '../models/book.dart';
import 'book_cover.dart';

class BookGridCard extends StatelessWidget {
  final Book book;
  final VoidCallback onTap;

  const BookGridCard({
    Key? key,
    required this.book,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEAE3D8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Center(
                    child: Hero(
                      tag: 'book_cover_${book.key}',
                      child: BookCover(
                        coverUrl: book.coverUrl,
                        width: double.infinity,
                        height: 140,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  book.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF292521),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'By ${book.authors.join(', ')}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF81786E),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${book.firstPublishYear ?? 'N/A'}',
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFFD99A55),
                    fontWeight: FontWeight.bold,
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
