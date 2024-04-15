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
            appBar: AppBar(
              title: const Padding(
                padding: EdgeInsetsDirectional.all(25),
                child: Text(
                  'Home',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsetsDirectional.only(start: 40),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'EGP ${cubb.balance}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Current balance ',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 40.0),
                    child: Row(
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(30),
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context1) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Form(
                                    key: formKey,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          'Add Todo',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8.0,
                                        ),
                                        defaultTextFormField(
                                          controller: cubb.titleController,
                                          hint: 'Title',
                                        ),
                                        const SizedBox(
                                          height: 8.0,
                                        ),
                                        defaultTextFormField(
                                          controller: cubb.amountController,
                                          hint: 'Amount',
                                          keyboardType: TextInputType.number,
                                        ),
                                        const SizedBox(
                                          height: 8.0,
                                        ),
                                        defaultTextFormField(
                                          controller: cubb.dateController,
                                          hint: 'Date',
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
                                        TextButton(
                                          onPressed: () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              cubb.CreateTransaction(
                                                  income: true,
                                                  title:
                                                      cubb.titleController.text,
                                                  date: 'date',
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
                                            'send',
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );

                            /*
                                  return Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextField(
                                            // controller: TransactionsCubit.get(context)
                                            //     .add_controller1,
                                            style:
                                                const TextStyle(fontSize: 25),
                                            decoration: InputDecoration(
                                              labelText: 'Transaction',
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              suffixIcon: const Padding(
                                                padding:
                                                    EdgeInsetsDirectional.all(
                                                        10.0),
                                                child: Icon(
                                                  Icons.account_circle,
                                                  size: 35,
                                                ),
                                              ),
                                            )),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        TextFormField(
                                          // controller: TransactionsCubit.get(context)
                                          //     .add_controller2,
                                          style: const TextStyle(fontSize: 25),
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              suffixIcon: const Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: Icon(
                                                  Icons.money,
                                                  size: 35,
                                                ),
                                              ),
                                              labelText: 'amount'),
                                        ),
                                        const SizedBox(
                                          height: 70,
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            cubb.CreateTransaction(
                                                income: true,
                                                title:
                                                    cubb.add_controller1.text,
                                                date: 'date',
                                                amount: double.parse(
                                                    cubb.add_controller2.text));
                                            cubb.updateBalance(double.parse(
                                                cubb.add_controller2.text));
                                            cubb.getData();
                                            cubb.add_controller1.clear();
                                            cubb.add_controller2.clear();

                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            'send',
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                  
                                });
                                */
                          },
                          child: CircleAvatar(
                            minRadius: 30,
                            backgroundColor: Colors.blue[70],
                            child: const Icon(
                              Icons.add,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(30),
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context1) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Form(
                                    key: formKey,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          'Add Todo',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8.0,
                                        ),
                                        defaultTextFormField(
                                          controller: cubb.titleController,
                                          hint: 'Title',
                                        ),
                                        const SizedBox(
                                          height: 8.0,
                                        ),
                                        defaultTextFormField(
                                          controller: cubb.amountController,
                                          hint: 'Amount',
                                          keyboardType: TextInputType.number,
                                        ),
                                        const SizedBox(
                                          height: 8.0,
                                        ),
                                        defaultTextFormField(
                                          controller: cubb.dateController,
                                          hint: 'Date',
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
                                        TextButton(
                                          onPressed: () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              cubb.CreateTransaction(
                                                  income: false,
                                                  title:
                                                      cubb.titleController.text,
                                                  date: 'date',
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
                                            'send',
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );

                            /*
                                  return Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextField(
                                            controller: cubb.add_controller1,
                                            style:
                                                const TextStyle(fontSize: 25),
                                            decoration: InputDecoration(
                                              labelText: 'Transaction',
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              suffixIcon: const Padding(
                                                padding:
                                                    EdgeInsetsDirectional.all(
                                                        10.0),
                                                child: Icon(
                                                  Icons.account_circle,
                                                  size: 35,
                                                ),
                                              ),
                                            )),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        TextFormField(
                                          controller: cubb.add_controller2,
                                          style: const TextStyle(fontSize: 25),
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              suffixIcon: const Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: Icon(
                                                  Icons.money,
                                                  size: 35,
                                                ),
                                              ),
                                              labelText: 'amount'),
                                        ),
                                        const SizedBox(
                                          height: 70,
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            cubb.CreateTransaction(
                                                income: false,
                                                title:
                                                    cubb.titleController.text,
                                                date: 'date',
                                                amount: double.parse(
                                                    cubb.amountController.text));
                                            cubb.updateBalance(-double.parse(
                                                cubb.amountController.text));
                                            cubb.getData();

                                            Navigator.pop(context);
                                            cubb.titleController.clear();
                                            cubb.dateController.clear();
                                            cubb.amountController.clear();

                                          },
                                          child: const Text(
                                            'send',
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                });
                                */
                          },
                          child: CircleAvatar(
                            minRadius: 30,
                            backgroundColor: Colors.blue[70],
                            child: const Icon(
                              Icons.send,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 80,
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
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: CircleAvatar(
            radius: 25,
            child: Icon(
              model.income! ? Icons.arrow_upward : Icons.arrow_downward,
              color: model.income! ? Colors.green : Colors.red,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${model.title}',
                maxLines: 3,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '${model.date}',
                style: const TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 20),
          child: Text(
            'EGP ${model.amount}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
