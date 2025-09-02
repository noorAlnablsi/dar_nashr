



import 'package:dar_nashr/models/quote_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuoteService {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: "https://project2copyrepo-12.onrender.com/"),
  );

  Future<List<Quote>> getQuotes({int skip = 0, int limit = 12}) async {
    try {
      final response = await _dio.get(
        "/quotes/",
        queryParameters: {"skip": skip, "limit": limit},
      );

      List data = response.data;
      return data.map((e) => Quote.fromJson(e)).toList();
    } catch (e) {
      throw Exception("فشل في جلب الاقتباسات: $e");
    }
  }

 
  Future<void> addQuote({
    required String text,
    required String bookName,
    String? authorName,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('access_token');

    if (token == null) {
      throw Exception("لا يوجد توكن. الرجاء تسجيل الدخول أولاً.");
    }

    try {
      await _dio.post(
        "/quotes/",
        data: {
          "text": text,
          "book_name": bookName,
          "author_name": authorName,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
    } catch (e) {
      print(e);
      throw Exception("فشل في إضافة الاقتباس: $e");
    }
  }
}
