import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/home.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
                "assets/photos/quiz.jpg",
                ),
           const Text(
              "Welcome To Quiz.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    // ignore: non_constant_identifier_names
                    builder: (Context) => const HomeScreen(),
                  ),
                );
              },
               icon: const Icon(
                Icons.play_lesson_sharp,
                size: 50,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
