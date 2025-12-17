import 'package:flutter/material.dart';
import 'package:snack_automat/models/product.dart';
import 'package:snack_automat/widget/slotTile.dart';
import 'package:snack_automat/models/slot.dart';

class Innerframe extends StatefulWidget {
  @override
  State<Innerframe> createState() => _InnerframeState();
}

class _InnerframeState extends State<Innerframe> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 11, 76, 175),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2.5.toInt(),
            child: Container(
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 76, 137, 207),
                borderRadius: BorderRadius.circular(10),
              ),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.6,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                children: [
                  Slottile(
                    slot: Slot(
                      product: Product(
                        id: 'p1',
                        name: 'Riegel',
                        price: 1.99,
                        image: 'images/snack.png',
                      ),
                    ),
                    onTap: () {},
                    selected: false,
                  ),
                  Slottile(
                    slot: Slot(
                      product: Product(
                        id: 'p2',
                        name: 'Chips',
                        price: 0.99,
                        image: 'images/snack.png',
                      ),
                    ),
                    onTap: () {},
                    selected: false,
                  ),
                  Slottile(
                    slot: Slot(
                      product: Product(
                        id: 'p1',
                        name: 'Kekse',
                        price: 1.99,
                        image: 'images/snack.png',
                      ),
                    ),
                    onTap: () {},
                    selected: false,
                  ),
                  Slottile(
                    slot: Slot(
                      product: Product(
                        id: 'p2',
                        name: 'Bonbons',
                        price: 0.99,
                        image: 'images/snack.png',
                      ),
                    ),
                    onTap: () {},
                    selected: false,
                  ),
                  Slottile(
                    slot: Slot(
                      product: Product(
                        id: 'p1',
                        name: 'Waffeln',
                        price: 1.99,
                        image: 'images/snack.png',
                      ),
                    ),
                    onTap: () {},
                    selected: false,
                  ),
                  Slottile(
                    slot: Slot(
                      product: Product(
                        id: 'p2',
                        name: 'Wasser',
                        price: 0.99,
                        image: 'images/snack.png',
                      ),
                    ),
                    onTap: () {},
                    selected: false,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1.5.toInt(),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 11, 76, 175),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
