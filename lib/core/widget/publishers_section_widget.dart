import 'package:dar_nashr/core/widget/publisher_card.dart';
import 'package:dar_nashr/core/widget/section_header_widget.dart';
import 'package:flutter/material.dart';

class PublishersSection extends StatelessWidget {
  const PublishersSection({super.key});

  final List<String> publishers = const [
    "دار الفكر",
    "دار الفكر",
    "دار الفكر",
    "دار الفكر",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: 'دور النشر', onViewAll: () {}),
        const SizedBox(height: 12),
        SizedBox(
          height: 110,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: publishers.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              return PublisherCard(name: publishers[index]);
            },
          ),
        ),
      ],
    );
  }
}
