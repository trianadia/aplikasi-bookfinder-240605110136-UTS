class Book {
  final String key;
  final String title;
  final List<String> authors;
  final int? firstPublishYear;
  final int? coverId;
  String? description;

  Book({
    required this.key,
    required this.title,
    required this.authors,
    this.firstPublishYear,
    this.coverId,
    this.description,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    var authorList = json['author_name'] != null
        ? List<String>.from(json['author_name'])
        : ['Unknown Author'];

    return Book(
      key: json['key'] ?? '',
      title: json['title'] ?? 'No Title',
      authors: authorList,
      firstPublishYear: json['first_publish_year'],
      coverId: json['cover_i'],
    );
  }

  String get coverUrl {
    if (coverId != null) {
      return 'https://covers.openlibrary.org/b/id/$coverId-M.jpg';
    }
    return 'https://via.placeholder.com/150?text=No+Cover';
  }
}
