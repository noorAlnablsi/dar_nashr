import 'package:dar_nashr/core/widget/book_card.dart';
import 'package:dar_nashr/services/book_service.dart';
import 'package:dar_nashr/services/categories_service.dart';
import 'package:flutter/material.dart';

class BooksByCategoryPage extends StatefulWidget {
  const BooksByCategoryPage({super.key});

  @override
  State<BooksByCategoryPage> createState() => _BooksByCategoryPageState();
}

class _BooksByCategoryPageState extends State<BooksByCategoryPage> {
  final CategoryService categoryService = CategoryService();
  final BookService bookService = BookService();

  List<dynamic> categories = [];
  List<dynamic> allBooks = [];
  List<dynamic> filteredBooks = [];
  int? selectedCategoryId;

  bool isLoadingCategories = true;
  bool isLoadingBooks = true;

  @override
  void initState() {
    super.initState();
    fetchCategories();
    fetchBooks();
  }

  void fetchCategories() async {
    final result = await categoryService.getCategories();
    setState(() {
      categories = result;
      isLoadingCategories = false;
    });
  }

  void fetchBooks() async {
    final result = await bookService.getAllBooks();
    setState(() {
      allBooks = result;
      filteredBooks = result; // أول ما نفتح الصفحة يعرض الكل
      isLoadingBooks = false;
    });
  }

  void filterBooksByCategory(int categoryId) {
    setState(() {
      selectedCategoryId = categoryId;
      filteredBooks = allBooks.where((book) {
        final cats = book["categories"] as List<dynamic>;
        return cats.any((c) => c["id"] == categoryId);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("الكتب حسب التصنيفات")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ✅ شريط التصنيفات
          SizedBox(
            height: 50,
            child: isLoadingCategories
                ? const Center(child: CircularProgressIndicator())
                : ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      final isSelected = selectedCategoryId == category["id"];
                      return GestureDetector(
                        onTap: () => filterBooksByCategory(category["id"]),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xff731F28) // خمري
                                : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              category["name"],
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),

          const SizedBox(height: 16),

          // ✅ عرض الكتب
          Expanded(
            child: isLoadingBooks
                ? const Center(child: CircularProgressIndicator())
                : filteredBooks.isEmpty
                    ? const Center(child: Text("لا يوجد كتب لهذا التصنيف"))
                    : GridView.builder(
                        padding: const EdgeInsets.all(12),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.65,
                        ),
                        itemCount: filteredBooks.length,
                        itemBuilder: (context, index) {
                          final book = filteredBooks[index];
                          return BookCard(
                            title: book['title'] ?? 'بدون عنوان',
                            publisherName:
                                book['publisher_house_name'] ?? 'غير معروف',
                            coverUrl: book['cover_url'], bookId: book['id'],
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
