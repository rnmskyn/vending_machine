import 'package:flutter/material.dart';
import 'package:snack_automat/models/product.dart';
import 'package:snack_automat/widget/slotTile.dart';
import 'package:snack_automat/models/slot.dart';

class Innerframe extends StatefulWidget {
  @override
  State<Innerframe> createState() => _InnerframeState();
}

class _InnerframeState extends State<Innerframe> {
  Product? _selectedProduct;

  final List<Slot> _slots = [
    Slot(
      product: Product(
        id: 'p1',
        name: 'Riegel',
        price: 1.99,
        image: 'images/snack.png',
      ),
    ),
    Slot(
      product: Product(
        id: 'p2',
        name: 'Chips',
        price: 0.99,
        image: 'images/kekse.png',
      ),
    ),
    Slot(
      product: Product(
        id: 'p3',
        name: 'Kekse',
        price: 1.99,
        image: 'images/kekse.png',
      ),
    ),
    Slot(
      product: Product(
        id: 'p4',
        name: 'Bonbons',
        price: 0.99,
        image: 'images/snack.png',
      ),
    ),
    Slot(
      product: Product(
        id: 'p5',
        name: 'Waffeln',
        price: 1.99,
        image: 'images/snack.png',
      ),
    ),
    Slot(
      product: Product(
        id: 'p6',
        name: 'Wasser',
        price: 0.99,
        image: 'images/popcorn.png',
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 3, 92, 87),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2.5.toInt(),
            child: Container(
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 3, 92, 87),
                borderRadius: BorderRadius.circular(10),
              ),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.6,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),

                children: _slots.map((slot) {
                  return Slottile(
                    slot: slot,

                    onTap: () {
                      setState(() {
                        _selectedProduct = slot.product;
                      });
                    },
                    selected: _selectedProduct?.id == slot.product.id,
                  );
                }).toList(),
              ),
            ),
          ),
          Expanded(
            flex: 1.5.toInt(),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 3, 92, 87),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(15),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 22, 22, 22),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'Münzen einwerfen',
                      style: TextStyle(fontSize: 11, color: Colors.white),

                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.all(5),

                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFFBDBDBD), // helles Metall
                          Color(0xFFD6D6D6), // Hauptfläche
                          Color(0xFFF0F0F0), // Glanzstreifen
                          Color(0xFFC2C2C2), // zurück
                        ],
                        stops: [0.0, 0.4, 0.6, 1.0],
                      ),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        width: 2,
                      ),
                    ),
                    child: _selectedProduct != null
                        ? Image.asset(_selectedProduct!.image)
                        : const SizedBox.shrink(),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 30,
                    width: 30,
                    margin: const EdgeInsets.symmetric(vertical: 5),

                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFFBDBDBD), // helles Metall
                          Color(0xFFD6D6D6), // Hauptfläche
                          Color(0xFFF0F0F0), // Glanzstreifen
                          Color(0xFFC2C2C2), // zurück
                        ],
                        stops: [0.0, 0.4, 0.6, 1.0],
                      ),

                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        width: 2,
                      ),
                    ),
                    child: const Text(
                      '|',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 1, 46, 40),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Kaufen',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 5),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 1, 46, 40),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Abbrechen',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 40,
                    margin: const EdgeInsets.symmetric(vertical: 5),

                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 59, 59, 59),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        width: 2,
                      ),
                    ),
                    child: const Text(
                      '',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 80,
                    width: 80,
                    margin: const EdgeInsets.symmetric(vertical: 5),

                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,

                        colors: [
                          Color.fromARGB(255, 29, 29, 29), // sehr dunkel
                          Color.fromARGB(255, 42, 42, 42), // mittel
                          Color.fromARGB(255, 58, 58, 58), // Highlight
                          Color.fromARGB(255, 37, 37, 37), // zurück
                        ],
                        stops: [0.0, 0.4, 0.6, 1.0],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 6,
                          offset: Offset(3, 4),
                        ),
                        BoxShadow(
                          color: Colors.white12,
                          blurRadius: 4,
                          offset: Offset(-2, -2),
                        ),
                      ],

                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        width: 2,
                      ),
                    ),
                    child: const Text(
                      '',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
