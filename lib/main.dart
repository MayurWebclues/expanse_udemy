import 'package:flutter/material.dart';

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
                    Container(
                      padding: EdgeInsets.all(14),
                      margin: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        border: Border.all(
                          color: Colors.blueAccent,
                          style: BorderStyle.solid,
                          width: 2.0,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '\$${tx.amount}',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.deepOrange),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tx.title,
                          style: TextStyle(fontSize: 14 ,fontWeight: FontWeight.bold,color: Colors.black),
                        ),
                        Text(
                          tx.date.toString(),
                          style: TextStyle(fontSize: 12 ,fontWeight: FontWeight.w300,color: Colors.grey),
                        ),
                      ],
                    ),
                    Icon(Icons.delete,color: Colors.red,size:20.0,)
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
