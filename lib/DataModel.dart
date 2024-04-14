class DataModel {
  double? amount;
  String? date;
  String? title;
  bool? income;

  DataModel(
      {required this.amount,
      required this.date,
      required this.title,
      required this.income});

  DataModel.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    date = json['date'];
    title = json['title'];
    income = json['income'];
  }

  // Map<String, dynamic> toMap() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['amount'] = amount;
  //   data['date'] = data;
  //   data['title'] = title;

  //   return data;
  // }
}
