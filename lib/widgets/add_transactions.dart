import 'package:flutter/material.dart';

class NewTransactions extends StatelessWidget {
   final Function txNewTras;
  NewTransactions(this.txNewTras, {Key? key}) : super(key: key);
  final textTitleController = TextEditingController();
  final textAmountController = TextEditingController();
  void onSubmitData(){
    var txTitleTemp  =textTitleController.text;
    var txAmountTemp  =textAmountController.text;
    if(txTitleTemp.isEmpty || txAmountTemp.isEmpty){
      return;
    }
    txNewTras(textTitleController.text,double.parse(textAmountController.text));
  }
  @override
  Widget build(BuildContext context) {
    return  Card(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 16),
        padding: EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end, //input fields
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              controller: textTitleController,
              onSubmitted: (_) => onSubmitData,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              controller: textAmountController,
              onSubmitted: (_) => onSubmitData,
            ),
            TextButton(
              onPressed: onSubmitData,
              child: const Text('Add Transactions'),
              style: ButtonStyle(
                  foregroundColor:
                  MaterialStateProperty.all(Colors.black87)),
            ),
          ],
        ),
      ),
    );
  }
}
