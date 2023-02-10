import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
                "https://images.unsplash.com/photo-1600093112291-7b553e3fcb82?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"),
            const SizedBox(height: 30),
            const Text(
              "Meme App",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
