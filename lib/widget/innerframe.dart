import 'package:flutter/material.dart';
import 'package:snack_automat/models/product.dart';
import 'package:snack_automat/models/transaction.dart';
import 'package:snack_automat/storage/snack_service.dart';
import 'package:snack_automat/widget/slotTile.dart';
import 'package:snack_automat/models/slot.dart';
import 'package:snack_automat/widget/coin_menu.dart';
import 'package:snack_automat/models/coinbox.dart';

class Innerframe extends StatefulWidget {
  @override
  State<Innerframe> createState() => _InnerframeState();
}

class _InnerframeState extends State<Innerframe> {
  Transaction? _currentTransaction;
  Product? _selectedProduct;
  String _displaymassage = '';
  Product? _dispensedProduct;

  List<Slot> _slots = [];
  final SnackService _service = SnackService();
  final Coinbox _coinBox = Coinbox();

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

  double get _currentBalance {
    return (_currentTransaction?.amountPaid ?? 0) / 100;
  }

  void _showCoinMenu() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return CoinMenu(
          onCoinTap: (double value) {
            setState(() {
              _displaymassage = '';
              _currentTransaction ??= Transaction(
                transactionId: UniqueKey().toString(),
              );
              int cents = (value * 100).round();
              _currentTransaction!.updatePayment(cents);
            });
          },
        );
      },
    );
  }

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

                        if (_currentTransaction != null) {
                          _currentTransaction!.setProduct(
                            slot.product.id,
                            slot.product.price,
                          );
                        } else {
                          _currentTransaction = Transaction(
                            transactionId: UniqueKey().toString(),
                            productId: slot.product.id,
                            price: slot.product.price,
                          );
                        }
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
                    child: Text(
                      _displaymassage
                              .isNotEmpty // Gibt es eine Nachricht (z.B. Rückgeld)?
                          ? _displaymassage // Dann zeige sie.
                          : _currentBalance >
                                0 // Wurde schon Geld eingeworfen?
                          ? '${_currentBalance.toStringAsFixed(2)} €' // Dann zeige den Kontostand.
                          : _selectedProduct !=
                                null // Wurde ein Produkt gewählt (aber noch nicht bezahlt)?
                          ? '${(_selectedProduct!.price / 100).toStringAsFixed(2)} €' // Dann zeige dessen Preis.
                          : 'Bitte Produkt wählen', // Ansonsten zeige den Standardtext.
                      style: TextStyle(
                        fontSize: _currentBalance == 0 ? 12 : 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 76, 248, 53),
                      ),

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
                  InkWell(
                    onTap: _showCoinMenu,
                    child: Container(
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
                      child: const Center(
                        child: Text(
                          '|',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_currentTransaction != null) {
                        PaymentResult result = _coinBox.processPayment(
                          _currentTransaction!.price,
                          _currentTransaction!.insertedCoins,
                        );
                        if (result.success) {
                          setState(() {
                            int totalChange = result.changeCoins.fold(
                              0,
                              (sum, coin) => sum + coin,
                            );
                            _displaymassage =
                                'Vielen Dank!\nRückgeld: ${(totalChange / 100).toStringAsFixed(2)} €';
                            _currentTransaction!.completeTransaction(
                              result.changeCoins,
                            );
                            _dispensedProduct = _selectedProduct;
                            _selectedProduct = null;
                            _currentTransaction = null;
                          });
                        } else {
                          setState(() {
                            double returned =
                                _currentTransaction!.amountPaid / 100.0;
                            _displaymassage =
                                ' ${result.message}\nRückgabe: ${returned.toStringAsFixed(2)} €';
                            _currentTransaction!.failTransaction();
                            _selectedProduct = null;
                            _currentTransaction = null;
                          });
                        }
                      }
                    },
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
                    onPressed: () {
                      if (_currentTransaction != null) {
                        setState(() {
                          double returned =
                              _currentTransaction!.amountPaid / 100.0;
                          _displaymassage =
                              'Abbruch\nRückgabe: ${returned.toStringAsFixed(2)} €';
                          _currentTransaction!.cancelTransaction();
                          _selectedProduct = null;
                          _currentTransaction = null;
                        });
                      }
                    },
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
                  InkWell(
                    onTap: () {
                      setState(() {
                        _displaymassage = '';
                        _dispensedProduct = null;
                        _selectedProduct = null;
                        _currentTransaction = null;
                      });
                    },
                    child: Container(
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
                      child: _dispensedProduct != null
                          ? Image.asset(_dispensedProduct!.image)
                          : const SizedBox.shrink(),
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
