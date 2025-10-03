import '../models/expense.dart';
import 'storage_service.dart';

class ExpenseService {
  static const String key = 'expenses';

  static Future<List<Expense>> getAll() async {
    final data = await StorageService.loadData(key);
    return data.map((e) => Expense(
      id: e['id'],
      title: e['title'],
      amount: e['amount'],
      category: e['category'],
      date: DateTime.parse(e['date']),
      description: e['description'],
    )).toList();
  }

  static Future<void> addExpense(Expense expense) async {
    final expenses = await getAll();
    expenses.add(expense);
    await _saveAll(expenses);
  }

  static Future<void> updateExpense(Expense updated) async {
    final expenses = await getAll();
    final index = expenses.indexWhere((e) => e.id == updated.id);
    if (index != -1) {
      expenses[index] = updated;
      await _saveAll(expenses);
    }
  }

  static Future<void> deleteExpense(String id) async {
    final expenses = await getAll();
    expenses.removeWhere((e) => e.id == id);
    await _saveAll(expenses);
  }

  static Future<void> _saveAll(List<Expense> expenses) async {
    await StorageService.saveData(
      key,
      expenses.map((e) => {
        'id': e.id,
        'title': e.title,
        'amount': e.amount,
        'category': e.category,
        'date': e.date.toIso8601String(),
        'description': e.description,
      }).toList(),
    );
  }
}
