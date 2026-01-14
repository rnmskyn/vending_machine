enum TransactionStatus { active, cancel, completed, failed }

class Transaction {
  final String transactionId;
  String? productId;
  int price;
  int amountPaid;
  TransactionStatus status;

  final List<int> insertedCoins;
  List<int> changeCoins;

  Transaction({
    required this.transactionId,
    this.productId,
    this.price = 0,
    this.amountPaid = 0, // Startet bei 0
    this.status = TransactionStatus.active, // Startet als "aktiv"
    List<int>? insertedCoins, // Optional beim Start
    List<int>? changeCoins, // Optional beim Start
  }) : insertedCoins = insertedCoins ?? [],
       changeCoins = changeCoins ?? [];

  int get missingAmount {
    return price - amountPaid;
  }

  void updatePayment(int coinValue) {
    insertedCoins.add(coinValue);
    amountPaid = amountPaid + coinValue;
  }

  void cancelTransaction() {
    status = TransactionStatus.cancel;
  }

  void completeTransaction(List<int> changeCoins) {
    this.changeCoins = changeCoins;
    status = TransactionStatus.completed;
  }

  void failTransaction() {
    status = TransactionStatus.failed;
  }

  void setProduct(String newproductId, int price) {
    productId = newproductId;
    this.price = price;
  }
}
