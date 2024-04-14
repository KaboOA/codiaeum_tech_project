import 'package:codiaeum_tech_project/TransactionsStates.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionsCubit extends Cubit<TransactionsStates> {
  TransactionsCubit() : super(InitialState());

  static TransactionsCubit get(context) => BlocProvider.of(context);

  // add controllers

  TextEditingController add_controller1 = TextEditingController();
  TextEditingController add_controller2 = TextEditingController();

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
//   List<DataModel> getData ()
//   {
//     List<DataModel> models =[];
// FirebaseFirestore.instance
//         .collection('Transactions')
//         .doc('transaction').get(Element){};
//     return models;
//   }
}
