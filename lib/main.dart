import 'package:expanse_udemy/widgets/user_transactions.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "HomePage",
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
       child:Column(
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
          UserTransactions(), // main denominator for both the widgets
        ],
      ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation:5 ,
        onPressed: () {  },
        child: Icon(Icons.add,size: 30),
      ),floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
