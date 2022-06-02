import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transactions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transaction = [
    Transaction(id: "t1", title: "Shoes", amount: 10.00, date: DateTime.now()),
    Transaction(
        id: "t12", title: "Grocery", amount: 70.00, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "HomePage",
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            margin: EdgeInsets.all(8),
            elevation: 5,
            child: Container(
              margin: const EdgeInsets.all(4),
              width: double.infinity,
              child: const Text(
                "Chart adding..!",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Column(
            children: transaction.map((tx) {
              return Card(
                elevation: 5,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ClipOval(
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 18),
                        color: Colors.orange,
                        child: Text(
                          '\$${tx.amount}',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tx.title,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text(
                          DateFormat.yMMMd().format(tx.date),
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 20.0,
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
