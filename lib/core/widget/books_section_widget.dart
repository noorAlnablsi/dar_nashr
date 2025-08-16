import 'package:dar_nashr/core/widget/book_card.dart';
import 'package:dar_nashr/core/widget/section_header_widget.dart';
import 'package:flutter/material.dart';

class BooksSection extends StatelessWidget {
  const BooksSection({super.key});

  final List<String> bookTitles = const [
    "رجال حول الرسول",
    "رجال حول الرسول",
    "رجال حول الرسول",
    "رجال حول الرسول",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: 'كتب قد تعجبك', onViewAll: () {}),
        const SizedBox(height: 12),
        SizedBox(
          height: 250,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: bookTitles.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              return BookCard(title: bookTitles[index]);
            },
          ),
        ),
      ],
    );
  }
}
