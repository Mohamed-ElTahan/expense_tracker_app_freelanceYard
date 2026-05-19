import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/expense.dart';
import 'expense_state.dart';

class ExpenseCubit extends Cubit<ExpenseState> {
  ExpenseCubit() : super(ExpenseInitial(expenses: []));

  void addExpense({
    required double amount,
    required ExpenseCategory category,
    required DateTime date,
  }) {
    final newExpense = Expense(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      category: category,
      amount: amount,
      date: date,
    );

    final updatedExpenses = state.expenses..add(newExpense);
    emit(ExpenseAdded(expenses: updatedExpenses));
  }

  // Remove an expense item from the state
  void deleteExpense(String id) {
    final updatedExpenses = state.expenses
        .where((expense) => expense.id != id)
        .toList();
    emit(ExpenseDeleted(expenses: updatedExpenses));
  }
}
