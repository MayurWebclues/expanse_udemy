
import 'package:expanse_udemy/widgets/add_transactions.dart';
import 'package:expanse_udemy/widgets/chart.dart';
import 'package:expanse_udemy/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/transactions.dart';

void main() {
      WidgetsFlutterBinding.ensureInitialized();
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitUp]);
       runApp(const MyApp());
  }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personel expanses',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: ThemeData.light().textTheme.copyWith(
            titleMedium: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 15,
                fontWeight: FontWeight.w300)),
        appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        fontFamily: 'Quicksand',
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _showChart=false;
  final List<Transaction> _transaction = [
    /*Transaction(id: "t1", title: "Shoes", amount: 10.00, date: DateTime.now()),
    Transaction(
        id: "t12", title: "Grocery", amount: 70.00, date: DateTime.now())*/
  ];

  void openSheet(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bctx) {
          return GestureDetector(
            child: NewTransactions(_addNewTransactions),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void _addNewTransactions(
      String txName, double txAmount, DateTime choosenDate) {
    final txNew = Transaction(
        id: DateTime.now().toString(),
        title: txName,
        amount: txAmount,
        date: choosenDate);
    setState(() {
      _transaction.add(txNew);
    });
  }

  void deleteTransactions(String id) {
    return setState(() {
      _transaction.removeWhere((element) => element.id == id);
    });
  }

  void toggleSwitch(){
    if(_showChart==true){
        setState((){
           _showChart=false;
        });
    }
    else {
      setState((){
        _showChart=true;
      });
    }
  }

  List<Transaction>? get recentTransactions {
    return _transaction.where((element) {
      return element.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text(
        "HomePage",
      ),
      actions: [
        IconButton(
            onPressed: () {
              openSheet(context);
            },
            icon: Icon(Icons.add))
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(children: [
              Text('Show Chart',style: Theme.of(context).textTheme.subtitle1,),
              Switch(value: _showChart, onChanged: (val) {
                toggleSwitch();
              }),
            ],),
            _showChart==true ? Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.2,
              child: Card(
                margin: EdgeInsets.all(8),
                elevation: 5,
                child: Container(
                  margin: const EdgeInsets.all(4),
                  width: double.infinity,
                  child: Chart(recentTransactions!),
                ),
              ),
            ):
            Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.7,
                child: TransactionList(_transaction, deleteTransactions)),
            // main denominator for both the widgets
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 5,
        onPressed: () {
          openSheet(context);
        },
        child: Icon(Icons.add, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
