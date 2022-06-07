import 'package:flutter/material.dart';

class NewTransactions extends StatefulWidget {
   final Function txNewTras;
  NewTransactions(this.txNewTras, {Key? key}) : super(key: key);

  @override
  State<NewTransactions> createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  final textTitleController = TextEditingController();
  final textAmountController = TextEditingController();

  void onSubmitData(){
    var txTitleTemp  =textTitleController.text;
    var txAmountTemp  =textAmountController.text;
    if(txTitleTemp.isEmpty || txAmountTemp.isEmpty){
      return;
    }
    widget.txNewTras(textTitleController.text,double.parse(textAmountController.text));
    Navigator.of(context).pop();
  }
  
  void openDatePicker(){
    showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2019), lastDate: DateTime.now()).then((value) {
          if(value==null){
            return;
          } else {

          }
    });
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
            Row(
              children: [
                Text('No date choosen',style: Theme.of(context).textTheme.titleSmall,),
                TextButton(onPressed: openDatePicker, child: Text('Choose Date',style: TextStyle(color: Colors.red,fontWeight: FontWeight.w300)))
              ],
            ),
            ElevatedButton(
              onPressed: onSubmitData,
              child: const Text('Add Transactions'),
              style: ButtonStyle(
                  foregroundColor:
                  MaterialStateProperty.all(Colors.white),backgroundColor: MaterialStateProperty.all(Colors.blue)),
                  
            ),
          ],
        ),
      ),
    );
  }
}
