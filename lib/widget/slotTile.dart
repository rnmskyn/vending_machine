import 'package:flutter/material.dart';
import 'package:snack_automat/models/slot.dart';

class Slottile extends StatelessWidget {
  final Slot slot;
  final VoidCallback onTap;
  final bool selected;
  const Slottile({
    super.key,
    required this.slot,
    required this.onTap,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    final disabled = slot.isEmpty();

    final prices = slot.product.price.toDouble() / 100;

    return InkWell(
      onTap: disabled ? null : onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: disabled
              ? const Color.fromARGB(255, 200, 200, 200)
              : selected
              ? const Color.fromARGB(255, 8, 133, 122)
              : const Color.fromARGB(255, 0, 49, 43),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selected
                ? const Color.fromARGB(255, 1, 80, 69)
                : const Color.fromARGB(255, 1, 80, 69),
            width: 2,
          ),
        ),
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Image.asset(slot.product.image, height: 50),
            const SizedBox(height: 5),

            Text(
        
              '${prices.toStringAsFixed(2)} €',
              style: TextStyle(
                color: disabled ? Colors.grey : Colors.white,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
