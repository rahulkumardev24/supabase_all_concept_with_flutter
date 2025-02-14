import 'package:flutter/material.dart';
import 'package:supabase_all_concept/authentication/sign_up_screen.dart';
import 'package:supabase_all_concept/home_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final supabase = Supabase.instance.client;
  bool isLoading = false;

  /// function for login
  Future<void> _login() async {
    final password = passwordController.text.trim();
    final email = emailController.text.trim();

    setState(() {
      isLoading = true;
    });
    try {

      await supabase.auth.signInWithPassword(password: password, email: email);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Successfully login",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 21, color: Colors.white),
        ),
        backgroundColor: Colors.greenAccent,
      ));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Login Failed")));
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "lib/assets/icons/login (1).png",
              height: 200,
            ),
            const Text("Welcome Back!",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue)),
            const SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                  labelText: "Email", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                  labelText: "Password", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _login();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade200,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  side: const BorderSide(width: 2, color: Colors.blue)),
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : const Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignupScreen()));
              },
              child: const Text(
                "Don't have an account? Sign Up",
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// In This video implement Authentication in flutter with supabase
/// In previous video we connect flutter with Supabase , First the video connect flutter with supabase , Link in the description Box
/// This is my login screen
/// we already created simple Ui for login and singup
///
/// know implement login => DONE
///
///
/// Final Test
/// ------------------ THANKS FOR WATCHING ---------------------------///
///
///
