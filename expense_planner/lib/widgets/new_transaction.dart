import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function(String, double, DateTime) addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _amountController = TextEditingController();
  final _titleController = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredAmount <= 0 || enteredTitle.isEmpty || _selectedDate == null) {
      return;
    }
    widget.addNewTransaction(_titleController.text,
        double.parse(_amountController.text), _selectedDate!);

    Navigator.of(context).pop();
  }

  void _presentDatePciker(BuildContext ctx) {
    showDatePicker(
      context: ctx,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: _titleController,
              // onChanged: (value) {
              //   titleInput = value;
              // },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              // onChanged: (value) {
              //   amountInput = value;
              // },
            ),
            SizedBox(
              height: 70,
              child: Row(
                children: [
                  Text(_selectedDate == null
                      ? 'No date Chosen!'
                      : 'Picked date: ${DateFormat.yMd().format(_selectedDate!)}'),
                  TextButton(
                    onPressed: () => _presentDatePciker(context),
                    child: const Text(
                      'Choose date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () => _submitData(),
              child: const Text(
                'Add Transaction',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
