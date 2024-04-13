import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    onTap: () {},
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
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
                child: ListView.separated(
              itemBuilder: (context, index) => builditem(),
              separatorBuilder: (context, index) => const SizedBox(
                height: 20,
              ),
              itemCount: 5,
            ))
          ],
        ),
      ),
    );
  }

  Widget builditem() {
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
        Container(
          width: 500,
          color: Colors.red,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Transaction is Wrtitten here ',
                maxLines: 3,
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'date here',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
