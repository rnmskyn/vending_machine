import 'package:flutter/material.dart';
import 'package:snack_automat/models/slot.dart';
import 'package:snack_automat/storage/snack_service.dart';
import 'package:snack_automat/models/coin.dart';

class Adminscreen extends StatefulWidget {
  const Adminscreen({super.key});

  @override
  State<Adminscreen> createState() => _AdminscreenState();
}

class _AdminscreenState extends State<Adminscreen> {
  List<Slot> _slots = [];
  List<Coin> _coins = [];
  final SnackService _service = SnackService();
  @override
  void initState() {
    super.initState();
    _loadSlots();
  }

  void _loadSlots() {
    setState(() {
      _slots = _service.getSlots();
    });
    setState(() {
      _coins = Coin.values.map((wert) => Coin(value: wert, count: 0)).toList();
    });
  }
double get _gesamtGeld {
  int summe=0;
    for (var coin in _coins) {
      summe += coin.value * coin.count;
    }
    return summe.toDouble() / 100; // Umwandlung in Euro
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Verwaltung")),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Warenbestand",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _slots.length,
              itemBuilder: (context, index) {
                final slot = _slots[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: ListTile(
                    leading: Image.asset(slot.product.image),
                    title: Text(slot.product.name),
                    subtitle: Text("Bestand: ${slot.quantity}"),
                    trailing: SizedBox(
                      width: 120,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () => setState(() => slot.decrement()),
                          ),
                          Text(slot.quantity.toString()),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () => setState(() => slot.increment()),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const Divider(thickness: 2), // Strich zur Trennung

          Padding(
            padding: EdgeInsets.all(8.0),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Wechselgeld",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                Text(
                  "Gesamt: ${_gesamtGeld.toStringAsFixed(2)} €",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _coins.length,
              itemBuilder: (context, index) {
                final coin = _coins[index];
                // Wir wickeln das ListTile in eine Card ein
                return Card(
                  // margin steuert den Abstand NACH AUSSEN (zu den anderen Karten)
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  // Wir verpacken das ListTile in ein Padding-Widget
                  child: Padding(
                    padding: const EdgeInsets.all(
                      8.0,
                    ), // 8 Pixel Abstand rundherum
                    child: ListTile(
                      leading: Image.asset(Coin.getImage(coin.value)),
                      // Hier teilen wir durch 100, um Euro anzuzeigen
                      title: Text("${(coin.value / 100).toStringAsFixed(2)} €"),
                      trailing: SizedBox(
                        width: 120,
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () => setState(() => coin.decrement()),
                            ),
                            Text(coin.count.toString()),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () => setState(() => coin.increment()),
                            ),
                          ],
                        ),
                      ),
                    ),
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
