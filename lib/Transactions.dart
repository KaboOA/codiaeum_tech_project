import 'package:codiaeum_tech_project/DataModel.dart';
import 'package:codiaeum_tech_project/TransactionsCubit.dart';
import 'package:codiaeum_tech_project/TransactionsStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List<DataModel> models = [];
    // models.add(DataModel(
    //     amount: 600,
    //     date: 'Date is here ',
    //     title: 'Transaction is Written here'));
    // models.add(DataModel(
    //     amount: 300,
    //     date: 'Date is here',
    //     title: 'Transaction is Written here'));
    // models.add(DataModel(
    //     amount: 400,
    //     date: 'Date is here',
    //     title: 'Transaction is Written here'));
    // models.add(DataModel(
    //     amount: 500,
    //     date: 'Date is here',
    //     title: 'Transaction is Written here'));

    return BlocProvider(
      create: (context) => TransactionsCubit()..getData(),
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
                  const Text(
                    'EGP 3,250',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
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
                          onTap: () {},
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
        const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: CircleAvatar(
            radius: 25,
            child: Icon(
              Icons.arrow_upward,
              size: 25,
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
}
