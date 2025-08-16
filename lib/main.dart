import 'package:dar_nashr/core/widget/row_login_register.dart';
import 'package:dar_nashr/pages/Auth/login_page.dart';
import 'package:dar_nashr/pages/Auth/new_password_page.dart';
import 'package:dar_nashr/pages/Auth/reset_password_page.dart';
import 'package:dar_nashr/pages/Auth/signup_page.dart';
import 'package:dar_nashr/pages/Auth/verification_page.dart';
import 'package:dar_nashr/pages/homepages/home_page.dart';
import 'package:dar_nashr/pages/onboarding/init_page.dart';
import 'package:dar_nashr/pages/splash_page.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: InitPage());
  }
}
