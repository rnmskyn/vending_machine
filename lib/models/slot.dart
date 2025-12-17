import 'package:snack_automat/models/product.dart';

class Slot {
  Product product;
  bool selected;
  int quantity;

  Slot({required this.product, this.quantity = 5, this.selected = false});

  bool isEmpty() {
    return quantity <= 0;
  }
}
