import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'expense_tracker/expense_tracker_screen.dart';
import 'expense_tracker/cubits/expense_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExpenseCubit(),
      child: MaterialApp(
        title: 'Track Expenses',
        debugShowCheckedModeBanner: false,
        home: const ExpenseTrackerScreen(),
      ),
    );
  }
}
