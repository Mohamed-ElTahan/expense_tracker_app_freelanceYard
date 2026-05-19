import '../models/expense.dart';

sealed class ExpenseState {
  final List<Expense> expenses;

  const ExpenseState({required this.expenses});
}

class ExpenseInitial extends ExpenseState {
  const ExpenseInitial({required super.expenses});
}

class ExpenseAdded extends ExpenseState {
  const ExpenseAdded({required super.expenses});
}

class ExpenseDeleted extends ExpenseState {
  const ExpenseDeleted({required super.expenses});
}
