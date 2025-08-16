
import 'package:dar_nashr/core/resources/color.dart';
import 'package:dar_nashr/pages/homepages/add_qout_page.dart';
import 'package:flutter/material.dart';
import 'package:dar_nashr/core/widget/quote_card.dart';
import 'package:dar_nashr/core/widget/quotes_header.dart'; 

class QuotesSection extends StatelessWidget {
  const QuotesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> quotes = [
      {
        'quote': "مادمت حيا فلا بد ان تعمل",
        'author': 'إسلام جمال لكنود',
        'addedBy':'نور النابلسي'
      },
      {
        'quote': "مادام الأمل طريقا فسنحياه",
         'author': 'إسلام جمال لكنود',
        'addedBy':"مرام حصري"
      },
      {   'quote': "لم نخلق عبثا",
         'author': 'إسلام جمال لكنود',
        'addedBy':"رنيم الأمين"
      }
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3, ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "اقتباسات مما كتب",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xff1D2A45),
            ),
          ),
          TextButton(
            onPressed: () { Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => AddQuotePage()),
                        );
             
            },
            child: const Text(
              "إضافة اقتباس",
              style: TextStyle(
                fontSize: 12,
                color: AppColors.secondary,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.secondary,
                
                decorationThickness: 1,
              ),
            ),
          ),
        ],
      ),
    ), 
         SizedBox(height: 8),
        SizedBox(
          height: 110,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: quotes.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final quote = quotes[index];
              return QuoteCard(

                quoteText: quote['quote']!,
                authorName: quote['author']!, addedBy: quote['addedBy']!,
              );
            },
          ),
        ),
      ],
    );
  }
}
