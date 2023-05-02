class Wallet {
  late String amount;
  late bool isBlocked;
  late int bonus;

  Wallet(
      {
        required this.amount,
        required this.isBlocked,
        required this.bonus});

  Wallet.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    isBlocked = json['isBlocked'];
    bonus = json['bonus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['amount'] = amount;
    data['isBlocked'] = isBlocked;
    data['bonus'] = bonus;
    return data;
  }
}