import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/expense_cubit.dart';
import '../models/expense.dart';

class ExpenseCard extends StatelessWidget {
  final Expense expense;

  const ExpenseCard({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    // Format date beautifully: YYYY-MM-DD
    final formattedDate =
        '${expense.date.year}-'
        '${expense.date.month.toString().padLeft(2, '0')}-'
        '${expense.date.day.toString().padLeft(2, '0')}';

    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black12, width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: expense.category.color.withValues(alpha: 0.12),
              shape: BoxShape.circle,
              border: Border.all(
                color: expense.category.color.withValues(alpha: 0.2),
              ),
            ),
            child: Icon(
              expense.category.icon,
              color: expense.category.color,
              size: 22,
            ),
          ),
          const SizedBox(width: 16),
          // Title & formatted date
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  expense.category.displayName,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  formattedDate,
                  style: const TextStyle(
                    color: Color(0xFF64748B),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Amount & Delete action
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '-\$${expense.amount.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 8),
              Material(
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    context.read<ExpenseCubit>().deleteExpense(expense.id);

                    // Show a sleek snackbar for undo capability or simple confirmation
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Removed "${expense.category.displayName}"',
                        ),
                        backgroundColor: Colors.black87,
                        duration: const Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF5E5E).withValues(alpha: 0.06),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.delete_outline_rounded,
                      color: Color(0xFFFF5E5E),
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
