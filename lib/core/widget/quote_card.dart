import 'package:flutter/material.dart';

class QuoteCard extends StatelessWidget {
  final String quoteText;
  final String authorName;
  final String addedBy; 

  const QuoteCard({
    super.key,
    required this.quoteText,
    required this.authorName,
    required this.addedBy,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xffE1D4B7),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                addedBy,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff1D2A45),
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.favorite_border,
                  size: 18,
                  color: Color(0xff1D2A45),
                ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {
                  
                },
              ),
            ],
          ),

          

          const SizedBox(height: 9),

          Text(
            quoteText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              height: 1.3,
              color: Color(0xff1D2A45),
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 12),

          Text(
            authorName,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xff731F28),
            ),
          ),
        ],
      ),
    );
  }
}
