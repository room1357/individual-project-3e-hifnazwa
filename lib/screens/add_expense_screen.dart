import 'package:flutter/material.dart';
import '../models/expense.dart';
import '../services/expense_service.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _selectedCategory = 'Makanan';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Pengeluaran')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(labelText: 'Judul'),
                  validator: (v) => v!.isEmpty ? 'Harus diisi' : null,
                ),
                TextFormField(
                  controller: _amountController,
                  decoration: const InputDecoration(labelText: 'Jumlah'),
                  keyboardType: TextInputType.number,
                  validator: (v) => v!.isEmpty ? 'Harus diisi' : null,
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Deskripsi'),
                  validator: (v) => v!.isEmpty ? 'Harus diisi' : null,
                ),
                DropdownButtonFormField(
                  value: _selectedCategory,
                  items: ['Makanan', 'Transportasi', 'Hiburan', 'Pendidikan']
                      .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                      .toList(),
                  onChanged: (value) {
                    setState(() => _selectedCategory = value!);
                  },
                  decoration: const InputDecoration(labelText: 'Kategori'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final expense = Expense(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        title: _titleController.text,
                        amount: double.parse(_amountController.text),
                        category: _selectedCategory,
                        date: DateTime.now(),
                        description: _descriptionController.text,
                      );
                      await ExpenseService.addExpense(expense);
                      Navigator.pop(context, true);
                    }
                  },
                  child: const Text('Simpan'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
