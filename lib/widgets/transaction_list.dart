import 'package:expanse_udemy/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transactions.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function delTx;

  TransactionList(this.transactions, this.delTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            children: [
              Text(
                "NO data added yet!",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: Image.asset(
                'assets/images/screen_one.png',
                fit: BoxFit.fill,
                width: double.maxFinite,
              ))
            ],
          )
        : Container(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return TransactionListItem(transactions[index],delTx);
              },
              itemCount: transactions.length,
            ),
          );
  }
}
