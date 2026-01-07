import 'package:flutter/material.dart';
import 'package:snack_automat/models/slot.dart';
import 'package:snack_automat/storage/snack_service.dart';
import 'package:snack_automat/widget/slotTile.dart';

class Adminscreen extends StatefulWidget {
  const Adminscreen({super.key});

  @override
  State<Adminscreen> createState() => _AdminscreenState();
}

class _AdminscreenState extends State<Adminscreen> {
  List<Slot> _slots = [];
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Verwaltung")),
      body: ListView.builder(
        itemCount: _slots.length,
        itemBuilder: (context, index) {
          final slot = _slots[index];
          return ListTile(
            leading: Image.asset(slot.product.image),
            title: Text(slot.product.name),
            subtitle: Text("Bestand: ${slot.quantity}"),
            trailing: SizedBox(
              width: 120,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        slot.decrement();
                      });
                    },
                  ),
                  Text(slot.quantity.toString()),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        slot.increment();
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
