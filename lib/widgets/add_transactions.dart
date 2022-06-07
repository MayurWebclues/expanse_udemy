import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransactions extends StatefulWidget {
  final Function txNewTras;

  NewTransactions(this.txNewTras, {Key? key}) : super(key: key);

  @override
  State<NewTransactions> createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  final _textTitleController = TextEditingController();
  final _textAmountController = TextEditingController();
  DateTime? _selectedDate;

  void onSubmitData() {
    var txTitleTemp = _textTitleController.text;
    var txAmountTemp = _textAmountController.text;
    if (txTitleTemp.isEmpty || txAmountTemp.isEmpty || _selectedDate==null) {
      return;
    }
    widget.txNewTras(
        _textTitleController.text, double.parse(_textAmountController.text),_selectedDate);
    Navigator.of(context).pop();
  }

  void openDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      setState((){
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
              controller: _textTitleController,
              onSubmitted: (_) => onSubmitData,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              controller: _textAmountController,
              onSubmitted: (_) => onSubmitData,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                  _selectedDate == null
                        ? 'No date choosen'
                        : DateFormat.yMd().format(_selectedDate!),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                TextButton(
                    onPressed: openDatePicker,
                    child: const Text('Choose Date',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w300)))
              ],
            ),
            ElevatedButton(
              onPressed: onSubmitData,
              child: const Text('Add Transactions'),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(Colors.blue)),
            ),
          ],
        ),
      ),
    );
  }
}
