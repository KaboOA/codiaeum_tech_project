import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codiaeum_tech_project/DataModel.dart';
import 'package:codiaeum_tech_project/TransactionsStates.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionsCubit extends Cubit<TransactionsStates> {
  TransactionsCubit() : super(InitialState());

  static TransactionsCubit get(context) => BlocProvider.of(context);

  // add controllers

  TextEditingController add_controller1 = TextEditingController();
  TextEditingController add_controller2 = TextEditingController();
  List<DataModel> models = [];
//   void CreateTransaction(
//       {required String title, required String date, required amount}) {
//     DataModel model = DataModel(amount: amount, date: date, title: title);
//     FirebaseFirestore.instance
//         .collection('Transactions')
//         .doc('transaction')
//         .set(model.toMap())
//         .then((value) {
//       emit(CreateTransactionState());
//     }).catchError((error) {});
//   }

  void getData() {
    emit(GetLoadingTransactionState());
    FirebaseFirestore.instance.collection('Transactions').get().then((value) {
      for (var element in value.docs) {
        models.add(DataModel.fromJson(element.data()));
      }
      debugPrint('wahba${models[0].title}');
      emit(GetSuccessTransactionState());
    }).catchError((error) {
      emit(GetFailedTransactionState());
    });
  }
}
