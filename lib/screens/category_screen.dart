import 'package:flutter/material.dart';
import '../models/category.dart';
import '../services/storage_service.dart';
import 'package:uuid/uuid.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Category> categories = [];
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    final data = await StorageService.loadData('categories');
    setState(() {
      categories = data.map<Category>((e) => Category.fromMap(Map<String, dynamic>.from(e))).toList();
    });
  }

  Future<void> _addCategory() async {
    if (_nameController.text.isEmpty) return;
    final newCategory = Category(
      id: const Uuid().v4(),
      name: _nameController.text,
      icon: 'category', // default icon
    );
    categories.add(newCategory);
    await _saveCategories();
    _nameController.clear();
  }

  Future<void> _deleteCategory(String id) async {
    categories.removeWhere((c) => c.id == id);
    await _saveCategories();
  }

  Future<void> _saveCategories() async {
    await StorageService.saveData('categories', categories.map((c) => c.toMap()).toList());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Manage Categories')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'New Category'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _addCategory,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: categories.isEmpty
                  ? const Center(child: Text('No categories yet'))
                  : ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return ListTile(
                    leading: const Icon(Icons.label),
                    title: Text(category.name),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deleteCategory(category.id),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
