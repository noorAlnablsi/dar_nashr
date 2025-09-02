import 'package:dar_nashr/services/add_book_fav.dart';
import 'package:flutter/material.dart';

class BookCard extends StatefulWidget {
  final int bookId;
  final String title;
  final String publisherName;
  final String? coverUrl;

  const BookCard({
    super.key,
    required this.bookId,
    required this.title,
    required this.publisherName,
    this.coverUrl,
  });

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  bool isFav = false;
  final BookService _bookService = BookService();

  Future<void> _toggleFavorite() async {
    try {
      final success = await _bookService.toggleFavorite(widget.bookId);

      if (success) {
        setState(() {
          isFav = !isFav;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              isFav
                  ? "تمت الإضافة إلى المفضلة "
                  : "تمت الإزالة من المفضلة ",
            ),
            backgroundColor: isFav ? Colors.green : Colors.red,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      debugPrint("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("حصل خطأ أثناء الإضافة للمفضلة"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String? resolvedCover = widget.coverUrl;
    if (resolvedCover != null && resolvedCover.startsWith('/')) {
      resolvedCover = 'https://project2copyrepo-12.onrender.com$resolvedCover';
    }

    return Container(
      width: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 6,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
       
          Expanded(
            flex: 7,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(12)),
                  child: resolvedCover != null && resolvedCover.isNotEmpty
                      ? Image.network(
                          resolvedCover,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          errorBuilder: (_, __, ___) => Image.asset(
                            'images/غلاف الكتاب.png',
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        )
                      : Image.asset(
                          'images/غلاف الكتاب.png',
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                ),
             
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: _toggleFavorite,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border,
                        color: const Color(0xff731F28),
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
              child: Column(
                children: [
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xff1D2A45),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.publisherName.isEmpty
                        ? 'غير معروف'
                        : widget.publisherName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xff731F28),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
