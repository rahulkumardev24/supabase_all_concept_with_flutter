import 'package:flutter/material.dart';
import 'package:supabase_all_concept/authentication/login_screen.dart';
import 'package:supabase_all_concept/storage/image_upload.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: 'https://igpdeazddklxmbtkmmhz.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlncGRlYXpkZGtseG1idGttbWh6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzk1MjMyNTMsImV4cCI6MjA1NTA5OTI1M30.U01aMu7oLgYVLhvCRnLvJ6mWp7e0o8P-YJrpjT3V6bw');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ImageUpload());
  }
}

/// In This video we connect supabase to Flutter
/// ------------------- CONNECT SUPABASE TO FLUTTER -------------------- ///
/// Simple Steps
/// Flow the steps
/// Step 1
/// create account on Supabase => DONE
/// Step 2
/// Connect with flutter  => DONE
///
/// Successfully Connect Supabase flutter
///
/// In Next Video Authentication
/// Thanks for watching
///
///
