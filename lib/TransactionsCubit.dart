import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codiaeum_tech_project/DataModel.dart';
import 'package:codiaeum_tech_project/TransactionsStates.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionsCubit extends Cubit<TransactionsStates> {
  TransactionsCubit() : super(InitialState());

  static TransactionsCubit get(context) => BlocProvider.of(context);

  // add controllers

  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  List<DataModel> models = [];
  double balance = 0;
  void CreateTransaction(
      {required String title,
      required String date,
      required double amount,
      required bool income}) {
    // DataModel model = DataModel(amount: 100, date: 'date', title: 'title');

    FirebaseFirestore.instance.collection('Transactions').doc().set({
      'amount': amount,
      'title': title,
      'date': date,
      'income': income
    }).then((value) {
      // print(model.toString());
      emit(CreateTransactionState());
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  void updateBalance(amount) {
    emit(GetLoadingBalanceState());
    double newBalance = balance + amount;
    FirebaseFirestore.instance
        .collection('TotalMoney')
        .doc('Money')
        .update({"money": newBalance}).then((value) {
      balance = newBalance;
      emit(GetSuccessBalanceState());
    }).catchError((error) {
      emit(GetFailedBalanceState());
    });
  }

  void getData() {
    models = [];
    emit(GetLoadingTransactionState());
    FirebaseFirestore.instance.collection('Transactions').get().then((value) {
      for (int i = 0; i < value.docs.length; i++) {
        models.add(DataModel.fromJson(value.docs[i].data()));
      }
      emit(GetSuccessTransactionState());
    }).catchError((error) {
      emit(GetFailedTransactionState());
    });
  }

  void getBalance() {
    emit(GetLoadingBalanceState());
    FirebaseFirestore.instance
        .collection('TotalMoney')
        .doc('Money')
        .get()
        .then((value) {
      balance = value.data()!['money'];
      emit(GetSuccessBalanceState());
    }).catchError((error) {
      emit(GetFailedBalanceState());
    });
  }
}
