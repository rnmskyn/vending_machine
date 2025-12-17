import 'package:flutter/material.dart';
import 'package:snack_automat/widget/innerframe.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Vending Machine")),
      body: Center(
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
                color: const Color.fromRGBO(0, 108, 170, 1),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 151, 180, 224),
            ),
            child: Innerframe(),
          ),
        ),
      ),
    );
  }
}
