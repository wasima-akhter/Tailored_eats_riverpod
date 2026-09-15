// lib/features/profile/presentation/screens/complete_profile_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/profile_api_state.dart';
import '../providers/profile_provider.dart';

class CompleteProfileScreen extends ConsumerStatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  ConsumerState<CompleteProfileScreen> createState() =>
      _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends ConsumerState<CompleteProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _ageController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  String? _gender;
  String? _activityLevel;
  String? _foodVibe;
  String? _mainGoal;
  String? _result;
  String? _training;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _ageController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_validateForm()) {
      return;
    }

    await ref
        .read(profileControllerProvider.notifier)
        .completeUserProfile(
          data: {
            'firstName': _firstNameController.text.trim(),
            'lastName': _lastNameController.text.trim(),
            'email': _emailController.text.trim(),
            'password': _passwordController.text,
            'age': int.tryParse(_ageController.text.trim()),
            'gender': _gender,
            'height': double.tryParse(_heightController.text.trim()),
            'weight': double.tryParse(_weightController.text.trim()),
            'activityLevel': _activityLevel,
            'foodVibe': _foodVibe,
            'mainGoal': _mainGoal,
            'result': _result,
            'training': _training,
          },
        );
  }

  bool _validateForm() {
    if (!_formKey.currentState!.validate()) {
      _showValidationSnack('Please complete all required fields.');
      return false;
    }

    final age = int.tryParse(_ageController.text.trim());
    if (age == null || age < 13 || age > 120) {
      _showValidationSnack('Please enter a valid age.');
      return false;
    }

    final height = double.tryParse(_heightController.text.trim());
    if (height == null || height <= 0) {
      _showValidationSnack('Please enter a valid height.');
      return false;
    }

    final weight = double.tryParse(_weightController.text.trim());
    if (weight == null || weight <= 0) {
      _showValidationSnack('Please enter a valid weight.');
      return false;
    }

    if (_gender == null ||
        _activityLevel == null ||
        _foodVibe == null ||
        _mainGoal == null ||
        _result == null ||
        _training == null) {
      _showValidationSnack('Please select all profile options.');
      return false;
    }

    return true;
  }

  void _showValidationSnack(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
      );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(profileControllerProvider);
    final apiState = state.completeProfileState;

    ref.listen(profileControllerProvider, (previous, next) {
      if (next.completeProfileState.status == ProfileApiStatus.success &&
          previous?.completeProfileState.status != ProfileApiStatus.success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Profile completed successfully.'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }

      if (next.completeProfileState.status == ProfileApiStatus.failure &&
          previous?.completeProfileState.status != ProfileApiStatus.failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              next.completeProfileState.errorMessage ??
                  'Unable to complete profile.',
            ),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Complete Profile'), centerTitle: false),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
            children: [
              _buildIntro(),
              const SizedBox(height: 24),

              _buildSection(
                title: 'Personal Information',
                icon: Icons.person_outline,
                children: [
                  _textField(
                    controller: _firstNameController,
                    label: 'First name',
                    textCapitalization: TextCapitalization.words,
                  ),
                  _textField(
                    controller: _lastNameController,
                    label: 'Last name',
                    textCapitalization: TextCapitalization.words,
                  ),
                  _textField(
                    controller: _emailController,
                    label: 'Email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  _textField(
                    controller: _passwordController,
                    label: 'Password',
                    obscureText: true,
                  ),
                ],
              ),

              const SizedBox(height: 18),

              _buildSection(
                title: 'Body Information',
                icon: Icons.monitor_weight_outlined,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _textField(
                          controller: _ageController,
                          label: 'Age',
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _textField(
                          controller: _heightController,
                          label: 'Height',
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  _textField(
                    controller: _weightController,
                    label: 'Weight',
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                  ),
                  _dropdown(
                    label: 'Gender',
                    value: _gender,
                    items: const [
                      _SelectOption(value: 'Male', label: 'Male'),
                      _SelectOption(value: 'Female', label: 'Female'),
                    ],
                    onChanged: (value) {
                      setState(() => _gender = value);
                    },
                  ),
                ],
              ),

              const SizedBox(height: 18),

              _buildSection(
                title: 'Lifestyle & Goals',
                icon: Icons.flag_outlined,
                children: [
                  _dropdown(
                    label: 'Activity level',
                    value: _activityLevel,
                    items: const [
                      _SelectOption(value: 'Sedentary', label: 'Sedentary'),
                      _SelectOption(value: 'Light', label: 'Lightly Active'),
                      _SelectOption(value: 'Active', label: 'Active'),
                      _SelectOption(value: 'Very_Active', label: 'Very Active'),
                    ],
                    onChanged: (value) {
                      setState(() => _activityLevel = value);
                    },
                  ),
                  _dropdown(
                    label: 'Food preference',
                    value: _foodVibe,
                    items: const [
                      _SelectOption(value: 'None', label: 'No Preference'),
                      _SelectOption(value: 'Vegetarian', label: 'Vegetarian'),
                      _SelectOption(value: 'Vegan', label: 'Vegan'),
                      _SelectOption(value: 'Dairy_Free', label: 'Dairy Free'),
                    ],
                    onChanged: (value) {
                      setState(() => _foodVibe = value);
                    },
                  ),
                  _dropdown(
                    label: 'Main goal',
                    value: _mainGoal,
                    items: const [
                      _SelectOption(
                        value: 'Loose_Weight',
                        label: 'Lose Weight',
                      ),
                      _SelectOption(value: 'Gain_Weight', label: 'Gain Weight'),
                      _SelectOption(
                        value: 'Body_Recamp',
                        label: 'Body Recomposition',
                      ),
                    ],
                    onChanged: (value) {
                      setState(() => _mainGoal = value);
                    },
                  ),
                  _dropdown(
                    label: 'Preferred result',
                    value: _result,
                    items: const [
                      _SelectOption(
                        value: 'Fast_As_Possible',
                        label: 'As Fast as Possible',
                      ),
                      _SelectOption(
                        value: 'Slow_But_Sustainable',
                        label: 'Slow but Sustainable',
                      ),
                      _SelectOption(
                        value: 'Life_Style_Change',
                        label: 'Lifestyle Change',
                      ),
                    ],
                    onChanged: (value) {
                      setState(() => _result = value);
                    },
                  ),
                  _dropdown(
                    label: 'Training frequency',
                    value: _training,
                    items: const [
                      _SelectOption(
                        value: '1-2_sessions/week',
                        label: '1–2 sessions per week',
                      ),
                      _SelectOption(
                        value: '3-4_sessions/week',
                        label: '3–4 sessions per week',
                      ),
                      _SelectOption(
                        value: '5+_sessions/week',
                        label: '5+ sessions per week',
                      ),
                    ],
                    onChanged: (value) {
                      setState(() => _training = value);
                    },
                  ),
                ],
              ),

              const SizedBox(height: 28),

              SizedBox(
                height: 54,
                child: ElevatedButton(
                  onPressed: apiState.isLoading ? null : _submit,
                  child: apiState.isLoading
                      ? const SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text(
                          'Complete Profile',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIntro() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tell us about yourself',
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 8),
        Text(
          'Complete your profile so we can personalize your nutrition and fitness experience.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            height: 1.4,
          ),
        ),
      ],
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 21, color: theme.colorScheme.primary),
              const SizedBox(width: 9),
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          ...children,
        ],
      ),
    );
  }

  Widget _textField({
    required TextEditingController controller,
    required String label,
    TextInputType? keyboardType,
    bool obscureText = false,
    TextCapitalization textCapitalization = TextCapitalization.none,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        textCapitalization: textCapitalization,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return '$label is required';
          }

          if (label == 'Email' &&
              !RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value.trim())) {
            return 'Enter a valid email address';
          }

          if (label == 'Password' && value.length < 6) {
            return 'Password must be at least 6 characters';
          }

          return null;
        },
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          prefixIcon: Icon(_fieldIcon(label)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }

  IconData _fieldIcon(String label) {
    switch (label) {
      case 'First name':
      case 'Last name':
        return Icons.person_outline;
      case 'Email':
        return Icons.email_outlined;
      case 'Password':
        return Icons.lock_outline;
      case 'Age':
        return Icons.cake_outlined;
      case 'Height':
        return Icons.height;
      case 'Weight':
        return Icons.monitor_weight_outlined;
      default:
        return Icons.edit_outlined;
    }
  }

  Widget _dropdown({
    required String label,
    required String? value,
    required List<_SelectOption> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: DropdownButtonFormField<String>(
        initialValue: value,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          prefixIcon: const Icon(Icons.tune_outlined),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        items: items
            .map(
              (item) => DropdownMenuItem<String>(
                value: item.value,
                child: Text(item.label),
              ),
            )
            .toList(),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$label is required';
          }
          return null;
        },
        onChanged: onChanged,
      ),
    );
  }
}

class _SelectOption {
  const _SelectOption({required this.value, required this.label});

  final String value;
  final String label;
}
