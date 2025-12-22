import 'package:flutter/material.dart';
import 'package:snack_automat/widget/innerframe.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('images/miau.webp', fit: BoxFit.cover),
          ),
          Center(
            child: AspectRatio(
              aspectRatio: 2 / 3,
              child: Container(
                margin: const EdgeInsets.all(30),
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 110, 110, 110),
                      spreadRadius: 5,
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                  border: Border.all(
                    color: const Color.fromARGB(255, 1, 43, 41),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 2, 145, 133),
                ),
                child: Innerframe(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
