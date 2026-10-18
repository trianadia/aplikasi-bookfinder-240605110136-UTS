import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/book.dart';

class BookService {
  static const String searchUrl = 'https://openlibrary.org/search.json';
  static const String workUrl = 'https://openlibrary.org';

  Future<List<Book>> searchBooks(String query) async {
    final url = Uri.parse('$searchUrl?q=$query&fields=key,title,author_name,first_publish_year,cover_i&limit=20');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List docs = data['docs'] ?? [];
        return docs.map((json) => Book.fromJson(json)).toList();
      } else {
        throw Exception('Gagal memuat data buku (Status: ${response.statusCode})');
      }
    } catch (e) {
      throw Exception('Terjadi kesalahan koneksi: $e');
    }
  }

  Future<String> fetchBookDescription(String workKey) async {
    // workKey contoh: /works/OL82563W
    final url = Uri.parse('$workUrl$workKey.json');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        var desc = data['description'];
        if (desc == null) {
          return 'Tidak ada deskripsi tersedia.';
        }
        if (desc is String) {
          return desc;
        } else if (desc is Map && desc.containsKey('value')) {
          return desc['value'];
        }
      }
      return 'Deskripsi tidak tersedia.';
    } catch (e) {
      return 'Gagal memuat deskripsi: $e';
    }
  }
}
