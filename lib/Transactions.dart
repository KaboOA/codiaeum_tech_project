// ignore_for_file: must_be_immutable
import 'package:codiaeum_tech_project/DataModel.dart';
import 'package:codiaeum_tech_project/TransactionsCubit.dart';
import 'package:codiaeum_tech_project/TransactionsStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class TransactionsScreen extends StatelessWidget {
  TransactionsScreen({super.key});
  GlobalKey<FormState> formKey = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransactionsCubit()
        ..getData()
        ..getBalance(),
      child: BlocConsumer<TransactionsCubit, TransactionsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          TransactionsCubit cubb = TransactionsCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: const Text(
                'أهلاَ ومرحباَ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsetsDirectional.only(start: 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    '${cubb.balance} ج.م',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  const Text(
                    'الرصيد الحالي',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 20.0),
                    child: Row(
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(30),
                          onTap: () {
                            scaffoldKey.currentState!.showBottomSheet(
                              (context1) {
                                return Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Form(
                                    key: formKey,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        defaultTextFormField(
                                          controller: cubb.titleController,
                                          hint: 'عنوان العملية',
                                        ),
                                        const SizedBox(
                                          height: 16.0,
                                        ),
                                        defaultTextFormField(
                                          controller: cubb.amountController,
                                          hint: 'المقدار',
                                          keyboardType: TextInputType.number,
                                        ),
                                        const SizedBox(
                                          height: 16.0,
                                        ),
                                        defaultTextFormField(
                                          controller: cubb.dateController,
                                          hint: 'تاريخ العملية',
                                          onTap: () async {
                                            final date = await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime.now(),
                                              lastDate: DateTime(2200),
                                              currentDate: DateTime.now(),
                                            );
                                            if (date != null) {
                                              cubb.dateController.text =
                                                  DateFormat('dd-MM-yyyy')
                                                      .format(date);
                                            }
                                          },
                                        ),
                                        const SizedBox(
                                          height: 16.0,
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              cubb.CreateTransaction(
                                                  income: true,
                                                  title:
                                                      cubb.titleController.text,
                                                  date:
                                                      cubb.dateController.text,
                                                  amount: double.parse(cubb
                                                      .amountController.text));
                                              cubb.updateBalance(double.parse(
                                                  cubb.amountController.text));
                                              cubb.getData();
                                              cubb.titleController.clear();
                                              cubb.amountController.clear();
                                              cubb.dateController.clear();

                                              Navigator.pop(context);
                                            }
                                          },
                                          child: const Text(
                                            'إرسال',
                                            style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Column(
                            children: [
                              CircleAvatar(
                                minRadius: 30,
                                backgroundColor: Colors.lightBlue[50],
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              const Text(
                                'إضافة',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(30),
                          onTap: () {
                            scaffoldKey.currentState!.showBottomSheet(
                              (context1) {
                                return Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Form(
                                    key: formKey,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        defaultTextFormField(
                                          controller: cubb.titleController,
                                          hint: 'عنوان العملية',
                                        ),
                                        const SizedBox(
                                          height: 16.0,
                                        ),
                                        defaultTextFormField(
                                          controller: cubb.amountController,
                                          hint: 'المقدار',
                                          keyboardType: TextInputType.number,
                                        ),
                                        const SizedBox(
                                          height: 16.0,
                                        ),
                                        defaultTextFormField(
                                          controller: cubb.dateController,
                                          hint: 'تاريخ العملية',
                                          onTap: () async {
                                            final date = await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime.now(),
                                              lastDate: DateTime(2200),
                                              currentDate: DateTime.now(),
                                            );
                                            if (date != null) {
                                              cubb.dateController.text =
                                                  DateFormat('dd-MM-yyyy')
                                                      .format(date);
                                            }
                                          },
                                        ),
                                        const SizedBox(
                                          height: 16.0,
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              cubb.CreateTransaction(
                                                  income: false,
                                                  title:
                                                      cubb.titleController.text,
                                                  date:
                                                      cubb.dateController.text,
                                                  amount: double.parse(cubb
                                                      .amountController.text));
                                              cubb.updateBalance(-double.parse(
                                                  cubb.amountController.text));
                                              cubb.getData();

                                              Navigator.pop(context);
                                              cubb.titleController.clear();
                                              cubb.dateController.clear();
                                              cubb.amountController.clear();
                                            }
                                          },
                                          child: const Text(
                                            'إرسال',
                                            style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Column(
                            children: [
                              CircleAvatar(
                                minRadius: 30,
                                backgroundColor: Colors.lightBlue[50],
                                child: const Icon(
                                  Icons.send,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              const Text(
                                'إرسال',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) =>
                          builditem(cubb.models[index]),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                      itemCount: cubb.models.length,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget builditem(DataModel model) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.grey.shade200,
          child: Icon(
            model.income!
                ? Icons.subdirectory_arrow_left_rounded
                : Icons.subdirectory_arrow_right_rounded,
            color: model.income! ? Colors.green : Colors.red,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${model.title}',
                maxLines: 3,
                style: const TextStyle(
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${model.date}',
                style: const TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${model.amount}',
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
              const Text(
                'ج.م',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget defaultTextFormField({
    required TextEditingController controller,
    required String hint,
    TextInputType? keyboardType = TextInputType.text,
    void Function()? onTap,
  }) {
    return TextFormField(
      validator: (val) {
        if (val!.isEmpty) {
          return '$hint is Required';
        }
        return null;
      },
      onTap: onTap,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: hint,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
