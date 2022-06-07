import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final String leble;
  final double spendingAmount;
  final double spendingTotalAmountPrc;

  BarChart(this.leble, this.spendingAmount, this.spendingTotalAmountPrc);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(child: Text('\$${spendingAmount.toStringAsFixed(0)}')),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.green, width: 1.0),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10)),
              ),
              FractionallySizedBox(
                heightFactor: spendingTotalAmountPrc,
                child: Container(
                  decoration:
                      BoxDecoration(color: Theme.of(context).primaryColor,borderRadius: BorderRadius.circular(10)),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 4),
        Text(leble)
      ],
    );
  }
}
