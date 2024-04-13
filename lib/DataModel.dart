class DataModel {
  double? amount;
  String? date;
  String? title;

  DataModel({
    required this.amount,
    required this.date,
    required this.title,
  });

  DataModel.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    date = json['date'];
    title = json['title'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['date'] = data;
    data['title'] = title;

    return data;
  }
}
