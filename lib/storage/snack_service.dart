import 'package:snack_automat/models/product.dart';
import 'package:snack_automat/models/slot.dart';

class SnackService {
  List<Slot> getSlots() {
    return [
      Slot(
        product: Product(
          id: 'p1',
          name: 'Riegel',
          price: 150,
          image: 'images/snack.png',
        ),
      ),
      Slot(
        product: Product(
          id: 'p2',
          name: 'Chips',
          price: 190,
          image: 'images/kekse.png',
        ),
      ),
      Slot(
        product: Product(
          id: 'p3',
          name: 'Kekse',
          price: 1,
          image: 'images/kekse.png',
        ),
      ),
      Slot(
        product: Product(
          id: 'p4',
          name: 'Bonbons',
          price: 3,
          image: 'images/snack.png',
        ),
      ),
      Slot(
        product: Product(
          id: 'p5',
          name: 'Waffeln',
          price: 1,
          image: 'images/snack.png',
        ),
      ),
      Slot(
        product: Product(
          id: 'p6',
          name: 'Wasser',
          price: 250,
          image: 'images/popcorn.png',
        ),
      ),
    ];
  }
}
