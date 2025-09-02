
import 'package:dio/dio.dart';

class VerifyOtpService {
  final Dio _dio = Dio();

  Future<bool> verifyOtp({required String email, required String otp}) async {
    const String url = 'https://project2copyrepo-12.onrender.com/verify-otp';

    try {
      Response response = await _dio.post(
        url,
        data: {
          'email': email,
          'otp': otp,
        },
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data;
        return data['verified'] == true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error verifying OTP: $e');
      return false;
    }
  }
}
