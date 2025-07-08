import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'page/splash_page.dart';
import 'page/login_page.dart';
import 'page/register_page.dart';
import 'page/home_admin_page.dart';
import 'page/home_buyer_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://binumueljghvffzussir.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJpbnVtdWVsamdodmZmenVzc2lyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTE4OTM4NjgsImV4cCI6MjA2NzQ2OTg2OH0.aOiuLYG3XT4KXvm-qPsNiD1drL1ktevTP7xLra4T8cw', // ganti sesuai full key Anda
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/admin': (context) => const HomeAdminPage(), // ✅ sudah diperbaiki
        '/buyer': (context) => const HomeBuyerPage(),
      },
    );
  }
}
