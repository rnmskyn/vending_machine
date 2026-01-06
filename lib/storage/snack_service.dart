import 'package:snack_automat/models/product.dart';
import 'package:snack_automat/models/slot.dart';

class SnackService {
  List<Slot> getSlots() {
    return [
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
  }
}
