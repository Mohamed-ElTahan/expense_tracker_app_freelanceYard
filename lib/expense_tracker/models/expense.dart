import 'package:flutter/material.dart';

enum ExpenseCategory {
  food,
  transport,
  shopping,
  entertainment,
  utilities,
  other;

  String get displayName {
    switch (this) {
      case ExpenseCategory.food:
        return 'Food & Dining';
      case ExpenseCategory.transport:
        return 'Transportation';
      case ExpenseCategory.shopping:
        return 'Shopping';
      case ExpenseCategory.entertainment:
        return 'Entertainment';
      case ExpenseCategory.utilities:
        return 'Utilities & Bills';
      case ExpenseCategory.other:
        return 'Other / Misc';
    }
  }

  IconData get icon {
    switch (this) {
      case ExpenseCategory.food:
        return Icons.restaurant_rounded;
      case ExpenseCategory.transport:
        return Icons.directions_car_rounded;
      case ExpenseCategory.shopping:
        return Icons.shopping_bag_rounded;
      case ExpenseCategory.entertainment:
        return Icons.local_play_rounded;
      case ExpenseCategory.utilities:
        return Icons.flash_on_rounded;
      case ExpenseCategory.other:
        return Icons.widgets_rounded;
    }
  }

  Color get color {
    switch (this) {
      case ExpenseCategory.food:
        return const Color(0xFFFF5E5E);
      case ExpenseCategory.transport:
        return const Color(0xFF3897FF);
      case ExpenseCategory.shopping:
        return const Color(0xFFD43DFF);
      case ExpenseCategory.entertainment:
        return const Color(0xFFFF9F1C);
      case ExpenseCategory.utilities:
        return const Color(0xFF00F5D4);
      case ExpenseCategory.other:
        return const Color(0xFF94A3B8);
    }
  }
}

class Expense {
  final String id;
  final ExpenseCategory category;
  final double amount;
  final DateTime date;

  const Expense({
    required this.id,
    required this.category,
    required this.amount,
    required this.date,
  });

  Expense copyWith({
    String? id,
    double? amount,
    DateTime? date,
    ExpenseCategory? category,
  }) {
    return Expense(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      category: category ?? this.category,
    );
  }
}
