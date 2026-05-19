import 'package:flutter/material.dart';
import 'widgets/add_expense_form.dart';
import 'widgets/expenses_list.dart';

class ExpenseTrackerScreen extends StatelessWidget {
  const ExpenseTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text(
          'Expenses Tracker',
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
        ),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              AddExpenseForm(),
              SizedBox(height: 16),
              Expanded(child: ExpensesList()),
            ],
          ),
        ),
      ),
    );
  }
}
