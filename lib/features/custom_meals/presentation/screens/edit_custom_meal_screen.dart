// lib/features/custom_meals/presentation/screens/edit_custom_meal_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/custom_meal.dart';
import '../providers/custom_meals_provider.dart';
import '../widgets/custom_meal_form.dart';

class EditCustomMealScreen extends ConsumerStatefulWidget {
  const EditCustomMealScreen({super.key, required this.meal});

  final CustomMeal meal;

  @override
  ConsumerState<EditCustomMealScreen> createState() =>
      _EditCustomMealScreenState();
}

class _EditCustomMealScreenState extends ConsumerState<EditCustomMealScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _calorieController;
  late final TextEditingController _proteinController;
  late final TextEditingController _carbController;
  late final TextEditingController _fatController;
  late final TextEditingController _prepTimeController;
  late final TextEditingController _instructionsController;

  late final List<TextEditingController> _ingredients;

  late String? _selectedMealType;

  @override
  void initState() {
    super.initState();

    final meal = widget.meal;

    _nameController = TextEditingController(text: meal.name);
    _calorieController = TextEditingController(text: meal.calorie.toString());
    _proteinController = TextEditingController(text: meal.protein.toString());
    _carbController = TextEditingController(text: meal.carb.toString());
    _fatController = TextEditingController(text: meal.fat.toString());
    _prepTimeController = TextEditingController(text: meal.prepTime);
    _instructionsController = TextEditingController(text: meal.instructions);

    _selectedMealType = meal.mealType.trim().isEmpty ? null : meal.mealType;

    _ingredients = meal.ingredients
        .map((ingredient) => TextEditingController(text: ingredient))
        .toList();

    if (_ingredients.isEmpty) {
      _ingredients.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _calorieController.dispose();
    _proteinController.dispose();
    _carbController.dispose();
    _fatController.dispose();
    _prepTimeController.dispose();
    _instructionsController.dispose();

    for (final controller in _ingredients) {
      controller.dispose();
    }

    super.dispose();
  }

  void _addIngredient() {
    setState(() {
      _ingredients.add(TextEditingController());
    });
  }

  void _removeIngredient(int index) {
    if (index < 0 || index >= _ingredients.length) {
      return;
    }

    final controller = _ingredients.removeAt(index);
    controller.dispose();

    setState(() {});
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_selectedMealType == null || _selectedMealType!.trim().isEmpty) {
      _showMessage('Please select a meal type.');
      return;
    }

    final ingredients = _ingredients
        .map((controller) => controller.text.trim())
        .where((value) => value.isNotEmpty)
        .toList();

    if (ingredients.isEmpty) {
      _showMessage('Please add at least one ingredient.');
      return;
    }

    final data = <String, dynamic>{
      'name': _nameController.text.trim(),
      'mealType': _selectedMealType,
      'calorie': int.tryParse(_calorieController.text.trim()) ?? 0,
      'protein': int.tryParse(_proteinController.text.trim()) ?? 0,
      'carb': int.tryParse(_carbController.text.trim()) ?? 0,
      'fat': int.tryParse(_fatController.text.trim()) ?? 0,
      'prepTime': _prepTimeController.text.trim(),
      'ingredients': ingredients,
      'instructions': _instructionsController.text.trim(),
    };

    final meal = await ref
        .read(customMealsControllerProvider.notifier)
        .editMeal(mealId: widget.meal.id, data: data);

    if (!mounted) {
      return;
    }

    if (meal != null) {
      Navigator.of(context).pop(meal);
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(customMealsControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Edit Custom Meal')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
          children: [
            CustomMealForm(
              nameController: _nameController,
              calorieController: _calorieController,
              proteinController: _proteinController,
              carbController: _carbController,
              fatController: _fatController,
              prepTimeController: _prepTimeController,
              instructionsController: _instructionsController,
              ingredients: _ingredients,
              selectedMealType: _selectedMealType,
              onMealTypeChanged: (value) {
                setState(() {
                  _selectedMealType = value;
                });
              },
              onAddIngredient: _addIngredient,
              onRemoveIngredient: _removeIngredient,
              isLoading: state.isSubmitting,
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 52,
              child: FilledButton(
                onPressed: state.isSubmitting ? null : _submit,
                child: state.isSubmitting
                    ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Save Changes'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
