import 'package:flutter/material.dart';

class BookCover extends StatelessWidget {
  final String? coverUrl;
  final double width;
  final double height;
  final BoxFit fit;

  const BookCover({
    Key? key,
    required this.coverUrl,
    this.width = 60,
    this.height = 90,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (coverUrl == null || coverUrl!.isEmpty) {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: const Color(0xFFEAE3D8),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Icon(Icons.book_outlined, color: Color(0xFF81786E), size: 28),
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        coverUrl!,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) => Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: const Color(0xFFEAE3D8),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Icon(Icons.broken_image_outlined, color: Color(0xFF81786E), size: 24),
          ),
        ),
      ),
    );
  }
}
