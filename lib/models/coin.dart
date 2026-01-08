class Coin {
  static const List<int> values = [1, 2, 5, 10, 20, 50, 100, 200];

  static String getImage(int value) {
    if (value == 1) return 'images/coins/oneCent.png';
    if (value == 2) return 'images/coins/twoCent.png';
    if (value == 5) return 'images/coins/fiveCent.png';
    if (value == 10) return 'images/coins/tenCent.png';
    if (value == 20) return 'images/coins/twentyCent.png';
    if (value == 50) return 'images/coins/fiftyCent.png';
    if (value == 100) return 'images/coins/oneEuro.png';
    if (value == 200) return 'images/coins/twoEuro.png';
    return 'images/snack.png';
  }

  //  speichern den Zustand für den Admin-Bereich.

  final int value;
  int count; // Wie viele Münzen liegen hier?

  Coin({required this.value, this.count = 0});

  void increment() {
    count++;
  }

  void decrement() {
    if (count > 0) {
      count--;
    }
  }

  bool isEmpty() {
    return count <= 0;
  }
}
