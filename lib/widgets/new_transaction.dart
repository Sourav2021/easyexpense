import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addtx;
  NewTransaction({Key? key, required this.addtx}) : super(key: key);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredamount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredamount <= 0) {
      return;
    }
    widget.addtx(enteredTitle, enteredamount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          TextField(
            onSubmitted: (_) => submitData(),
            controller: titleController,
            decoration: InputDecoration(
              labelText: 'Item Name',
            ),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitData(),
            controller: amountController,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Date'),
            keyboardType: TextInputType.datetime,
          ),
          TextButton(
            onPressed: submitData,
            child: Text('add item'),
          )
        ],
      ),
    );
  }
}
