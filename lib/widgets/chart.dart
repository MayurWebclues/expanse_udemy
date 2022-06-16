import 'package:expanse_udemy/widgets/barchart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transactions.dart';

class Chart extends StatelessWidget {
  List<Transaction> listTransaction = [];

  Chart(this.listTransaction);

  List<Map<String, Object>> get groupTransactionsValues {
    print(listTransaction.length);
    return List.generate(7, (index) {
      var weekDays = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;
      for (int i = 0; i < listTransaction.length; i++) {
        print("NOT TRUE");
        if (listTransaction[i].date.day == weekDays.day &&
            listTransaction[i].date.month == weekDays.month &&
            listTransaction[i].date.year == weekDays.year) {
          totalSum += listTransaction[i].amount;
        }
      }
      print(DateFormat.E().format(weekDays));
      print(totalSum);
      return {
        'day': DateFormat.E().format(weekDays).substring(0, 1),
        'amount': totalSum
      };
    });
  }

  double get totalSpending {
    return groupTransactionsValues.fold(0.0, (previousValue, element) {
      return previousValue + double.parse(element['amount'].toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(

      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: groupTransactionsValues.map((data) {
        return Container(

          child: Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: BarChart(
                  data['day'].toString(),
                  double.parse(data['amount'].toString()),
                  totalSpending == 0.0
                      ? 0.0
                      : (data['amount'] as double) / totalSpending)),
        );
      }).toList(),
    );
  }
}
