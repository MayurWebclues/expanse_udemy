import 'package:flutter/material.dart';
import '../models/transactions.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
   final List<Transaction> transactions;

   TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (context,index) {
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
                   color: Theme.of(context).backgroundColor,

                   child: SizedBox(
                     width: 50,
                     child: Text(
                       '\$${transactions[index].amount.toStringAsFixed(2)}',
                       textAlign: TextAlign.center,
                       style:  TextStyle(
                           fontSize: 15,
                           fontWeight: FontWeight.bold,
                           color: Theme.of(context).primaryColorDark),
                     ),
                   ),
                 ),
               ),
               Column(
                 mainAxisSize: MainAxisSize.min,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(
                     transactions[index].title,
                     style:  TextStyle(
                         fontSize: 14,
                         fontWeight: FontWeight.bold,
                         color: Theme.of(context).primaryColorDark),
                   ),
                   Text(
                     DateFormat.yMMMd().format(transactions[index].date),
                     style: const TextStyle(
                         fontSize: 12,
                         fontWeight: FontWeight.w300,
                         color: Colors.grey),
                   ),
                 ],
               ),
               const Icon(
                 Icons.delete,
                 color: Colors.red,
                 size: 20.0,
               )
             ],
           ),
         );
        },
        itemCount: transactions.length,

      ),
    );
  }
}
