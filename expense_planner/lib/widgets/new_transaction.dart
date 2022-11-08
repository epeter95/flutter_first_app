import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function(String, double) addNewTransaction;
  final amountController = TextEditingController();
  final titleController = TextEditingController();
  NewTransaction(this.addNewTransaction);
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
              controller: titleController,
              // onChanged: (value) {
              //   titleInput = value;
              // },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: amountController,
              // onChanged: (value) {
              //   amountInput = value;
              // },
            ),
            TextButton(
              onPressed: () => addNewTransaction(
                titleController.text,
                double.parse(amountController.text),
              ),
              child: const Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
