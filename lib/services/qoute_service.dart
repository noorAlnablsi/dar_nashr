


import 'package:dio/dio.dart';

class AddQuoteService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://project2copyrepo-8.onrender.com';

  Future<bool> addQuote({
    required String text,
    required int bookId,
  }) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/quotes/',
        data: {
          'text': text,
          'book_id': bookId,
        },
        options: Options(
          headers: {
            'accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        print("فشل في الإضافة: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      print("خطأ في Dio: $e");
      return false;
    }
  }
}
