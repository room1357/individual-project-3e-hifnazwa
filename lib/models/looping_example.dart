import 'expense.dart';

class LoopingExamples {
  /// Menghitung total pengeluaran pakai for loop biasa
  static double totalWithFor(List<Expense> expenses) {
    double total = 0.0;
    for (int i = 0; i < expenses.length; i++) {
      total += expenses[i].amount;
    }
    return total;
  }

  /// Menghitung total pengeluaran pakai for-in
  static double totalWithForIn(List<Expense> expenses) {
    double total = 0.0;
    for (var expense in expenses) {
      total += expense.amount;
    }
    return total;
  }

  /// Menghitung total pengeluaran pakai forEach
  static double totalWithForEach(List<Expense> expenses) {
    double total = 0.0;
    expenses.forEach((expense) {
      total += expense.amount;
    });
    return total;
  }

  /// Menghitung total pengeluaran pakai fold
  static double totalWithFold(List<Expense> expenses) {
    return expenses.fold(0.0, (sum, expense) => sum + expense.amount);
  }

  /// Menghitung total pengeluaran pakai map + reduce
  static double totalWithMapReduce(List<Expense> expenses) {
    return expenses.map((e) => e.amount).reduce((a, b) => a + b);
  }
}
