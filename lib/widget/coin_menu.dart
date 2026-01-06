import 'package:flutter/material.dart';

class CoinMenu extends StatelessWidget {
  // Das ist unser "heißer Draht" nach oben.
  // Wir verlangen eine Funktion, die eine Zahl (double) entgegennimmt.
  final Function(double) onCoinTap;

  const CoinMenu({super.key, required this.onCoinTap});

  // AUFGABE 1: Kopiere hier deine _getCoinImage Methode rein.
  // Tipp: Du kannst den Unterstrich (_) weglassen, da sie nur hier gebraucht wird,
  // oder ihn lassen, beides ist okay.
  String getCoinImage(double value) {
    if (value == 0.01) return 'images/coins/oneCent.png';
    if (value == 0.02) return 'images/coins/twoCent.png';
    if (value == 0.05) return 'images/coins/fiveCent.png';
    if (value == 0.10) return 'images/coins/tenCent.png';
    if (value == 0.20) return 'images/coins/twentyCent.png';
    if (value == 0.50) return 'images/coins/fiftyCent.png';
    if (value == 1.00) return 'images/coins/oneEuro.png';
    if (value == 2.00) return 'images/coins/twoEuro.png';
    return 'images/snack.png';
  }

  @override
  Widget build(BuildContext context) {
    // AUFGABE 2: Kopiere die Liste 'coins' hier rein.
    final List<double> coins = [0.01, 0.02, 0.05, 0.10, 0.20, 0.50, 1.00, 2.00];

    // AUFGABE 3: Nimm den ganzen Container-Code aus deinem showModalBottomSheet
    // und füge ihn hier als return ein.
    return Container(
      height: 300,
      padding: const EdgeInsets.all(20),
      color: Colors.grey[200],
      child: Column(
        children: [
          const Text(
            "Wähle eine Münze",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: coins.length,
              itemBuilder: (context, index) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(5),
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () => onCoinTap(coins[index]),
                  child: Image.asset(
                    getCoinImage(coins[index]),
                    fit: BoxFit.contain,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
