import 'package:flutter/material.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text('Home'),
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 25),
            child: Text(
              'EGP 3,250',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Current balance ',
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
              const SizedBox(
                width: 30,
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.send))
            ],
          )
        ],
      ),
    );
  }
}
