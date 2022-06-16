import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transactions.dart';

class TransactionListItem extends StatefulWidget {
  const TransactionListItem(this.items, this.delTx);

  final Transaction items;
  final Function delTx;

  @override
  State<TransactionListItem> createState() => _TransactionListItemState();
}

class _TransactionListItemState extends State<TransactionListItem> {
  Color? _bgColor;
  @override
  void initState() {
    const availableColors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.purple,
    ];
    _bgColor=availableColors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            height: 60,
            width: 60,
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: SizedBox(
              child: Center(
                child: CircleAvatar(

                  child: Text(
                    '\$${widget.items.amount.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.subtitle1,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.items.title,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColorDark),
                ),
                Text(
                  DateFormat.yMMMd().format(widget.items.date),
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 16,
            ),
            child: MediaQuery.of(context).size.width < 200
                ? ElevatedButton.icon(
                    onPressed: widget.delTx(widget.items.id),
                    label: Text("delete",
                        style: Theme.of(context).textTheme.bodyText1),
                    icon: const Icon(
                      Icons.delete,
                      size: 24,
                    ),
                  )
                : IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      widget.delTx(widget.items.id);
                    },
                    color: Colors.red,
                  ),
          )
        ],
      ),
    );
  }
}
