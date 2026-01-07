import 'package:snack_automat/models/product.dart';

class Slot {
  static const int maxCapacity = 5;

  Product product;
  bool selected;
  int quantity;

  Slot({
    required this.product,
    this.quantity = maxCapacity,
    this.selected = false,
  });

  bool isEmpty() {
    return quantity <= 0;
  }

  void increment() {
    if (quantity < maxCapacity) {
      quantity++;
    }
  }

  void decrement() {
    if (quantity > 0) {
      quantity--;
    }
  }
}
