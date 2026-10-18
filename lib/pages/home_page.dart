import 'package:flutter/material.dart';
import '../models/book.dart';
import '../services/open_library_service.dart';
import '../widgets/book_grid_card.dart';
import 'search_results_page.dart';
import 'book_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  final OpenLibraryService _bookService = OpenLibraryService();
  late Future<List<Book>> _exploreBooksFuture;

  final List<Map<String, dynamic>> _popularCategories = [
    {'name': 'Fiction', 'icon': Icons.menu_book},
    {'name': 'Science', 'icon': Icons.science},
    {'name': 'History', 'icon': Icons.public},
    {'name': 'Fantasy', 'icon': Icons.auto_stories},
    {'name': 'Flutter', 'icon': Icons.phone_android},
    {'name': 'Programming', 'icon': Icons.code},
  ];

  @override
  void initState() {
    super.initState();
    _exploreBooksFuture = _bookService.searchBooks('bestseller');
  }

  void _performSearch(String query) {
    if (query.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a search term!'),
          backgroundColor: Color(0xFF6B4226),
        ),
      );
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchResultsPage(query: query.trim()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF7F0),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Custom Top Bar with Logo & Badge
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFF6B4226),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.book, color: Colors.white, size: 22),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'BookFinder',
                        style: TextStyle(
                          color: Color(0xFF6B4226),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEAE3D8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'v1.0 UTS',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6B4226),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Stunning Featured Banner Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF6B4226), Color(0xFF8D5B3C), Color(0xFFD99A55)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF6B4226).withOpacity(0.25),
                      blurRadius: 15,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        'DISCOVERY OF THE DAY',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Find your next favorite book',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Explore millions of titles instantly from Open Library API with zero configuration.',
                      style: TextStyle(
                        color: Color(0xFFF3EFE6),
                        fontSize: 13,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Modern Search Bar with Shadow
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Search books, authors, topics...',
                          hintStyle: const TextStyle(color: Color(0xFF81786E), fontSize: 14),
                          prefixIcon: const Icon(Icons.search, color: Color(0xFF6B4226)),
                          filled: true,
                          fillColor: const Color(0xFFFFFFFF),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(color: Color(0xFFEAE3D8)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(color: Color(0xFF6B4226), width: 1.5),
                          ),
                        ),
                        onSubmitted: (value) => _performSearch(value),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 52,
                      decoration: BoxDecoration(
                        color: const Color(0xFF6B4226),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_forward, color: Colors.white),
                        onPressed: () => _performSearch(_searchController.text),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 26),

              // Popular Categories / Quick Chips
              const Text(
                'Popular Categories',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF292521),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 42,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _popularCategories.length,
                  itemBuilder: (context, index) {
                    final cat = _popularCategories[index];
                    return Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: ActionChip(
                        backgroundColor: const Color(0xFFFFFFFF),
                        side: const BorderSide(color: Color(0xFFEAE3D8)),
                        avatar: Icon(cat['icon'] as IconData, size: 16, color: const Color(0xFF6B4226)),
                        label: Text(
                          cat['name'] as String,
                          style: const TextStyle(
                            color: Color(0xFF6B4226),
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                        onPressed: () {
                          _searchController.text = cat['name'] as String;
                          _performSearch(cat['name'] as String);
                        },
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 26),

              // Explore Books Section Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Explore Books',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF292521),
                        ),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        'Curated bestsellers & top picks',
                        style: TextStyle(fontSize: 12, color: Color(0xFF81786E)),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () => _performSearch('bestseller'),
                    child: const Text(
                      'See All',
                      style: TextStyle(
                        color: Color(0xFFD99A55),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Explore Books Grid via FutureBuilder
              FutureBuilder<List<Book>>(
                future: _exploreBooksFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(50.0),
                        child: CircularProgressIndicator(color: Color(0xFF6B4226)),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            const Text('Failed to load books.', style: TextStyle(color: Color(0xFF81786E))),
                            const SizedBox(height: 8),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF6B4226)),
                              onPressed: () {
                                setState(() {
                                  _exploreBooksFuture = _bookService.searchBooks('bestseller');
                                });
                              },
                              child: const Text('Retry'),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No books found.'));
                  }

                  final books = snapshot.data!;
                  final displayBooks = books.length > 6 ? books.sublist(0, 6) : books;

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.62,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                    ),
                    itemCount: displayBooks.length,
                    itemBuilder: (context, index) {
                      final book = displayBooks[index];
                      return BookGridCard(
                        book: book,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookDetailsPage(book: book),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
