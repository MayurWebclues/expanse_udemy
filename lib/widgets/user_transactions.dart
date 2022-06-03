import 'package:expanse_udemy/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import '../models/transactions.dart';
import 'add_transactions.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _transaction = [
    Transaction(id: "t1", title: "Shoes", amount: 10.00, date: DateTime.now()),
    Transaction(id: "t12", title: "Grocery", amount: 70.00, date: DateTime.now())
  ];

  void _addNewTransactions(String txName , double txAmount){
      final txNew = Transaction(id: DateTime.now().toString(), title: txName, amount: txAmount, date: DateTime.now());
      setState((){
        _transaction.add(txNew);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransactions(_addNewTransactions),
        TransactionList(_transaction)
      ],
    );
  }
}
