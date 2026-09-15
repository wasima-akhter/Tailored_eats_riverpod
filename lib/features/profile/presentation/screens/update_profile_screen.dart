// lib/features/profile/presentation/screens/update_profile_screen.dart

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/profile_api_state.dart';
import '../providers/profile_provider.dart';

class UpdateProfileScreen extends ConsumerStatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  ConsumerState<UpdateProfileScreen> createState() =>
      _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends ConsumerState<UpdateProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _heightController = TextEditingController();

  String? _gender;
  String? _activityLevel;
  String? _foodVibe;
  String? _mainGoal;
  String? _result;
  String? _training;

  File? _profileImage;

  static const _genderOptions = <_SelectOption>[
    _SelectOption(value: 'Male', label: 'Male'),
    _SelectOption(value: 'Female', label: 'Female'),
  ];

  static const _activityOptions = <_SelectOption>[
    _SelectOption(value: 'Sedentary', label: 'Sedentary'),
    _SelectOption(value: 'Light', label: 'Lightly Active'),
    _SelectOption(value: 'Active', label: 'Active'),
    _SelectOption(value: 'Very_Active', label: 'Very Active'),
  ];

  static const _foodVibeOptions = <_SelectOption>[
    _SelectOption(value: 'None', label: 'No Preference'),
    _SelectOption(value: 'Vegetarian', label: 'Vegetarian'),
    _SelectOption(value: 'Vegan', label: 'Vegan'),
    _SelectOption(value: 'Dairy_Free', label: 'Dairy Free'),
  ];

  static const _mainGoalOptions = <_SelectOption>[
    _SelectOption(value: 'Loose_Weight', label: 'Lose Weight'),
    _SelectOption(value: 'Gain_Weight', label: 'Gain Weight'),
    _SelectOption(value: 'Body_Recamp', label: 'Body Recomposition'),
  ];

  static const _resultOptions = <_SelectOption>[
    _SelectOption(value: 'Fast_As_Possible', label: 'As Fast as Possible'),
    _SelectOption(value: 'Slow_But_Sustainable', label: 'Slow but Sustainable'),
    _SelectOption(value: 'Life_Style_Change', label: 'Lifestyle Change'),
  ];

  static const _trainingOptions = <_SelectOption>[
    _SelectOption(value: '1-2_sessions/week', label: '1–2 sessions per week'),
    _SelectOption(value: '3-4_sessions/week', label: '3–4 sessions per week'),
    _SelectOption(value: '5+_sessions/week', label: '5+ sessions per week'),
  ];

  @override
  void initState() {
    super.initState();

    final profile = ref.read(profileControllerProvider).profile;

    if (profile != null) {
      _firstNameController.text = profile.firstName;
      _lastNameController.text = profile.lastName;
      _ageController.text = profile.age?.toString() ?? '';
      _heightController.text = profile.height?.toString() ?? '';

      _gender = _validValue(profile.gender, _genderOptions);
      _activityLevel = _validValue(profile.activityLevel, _activityOptions);
      _foodVibe = _validValue(profile.foodVibe, _foodVibeOptions);
      _mainGoal = _validValue(profile.mainGoal, _mainGoalOptions);
      _result = _validValue(profile.result, _resultOptions);
      _training = _validValue(profile.training, _trainingOptions);
    }
  }

  String? _validValue(String? value, List<_SelectOption> options) {
    if (value == null) {
      return null;
    }

    return options.any((option) => option.value == value) ? value : null;
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();

    final image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );

    if (image == null) {
      return;
    }

    setState(() {
      _profileImage = File(image.path);
    });
  }

  Future<void> _submit() async {
    FocusManager.instance.primaryFocus?.unfocus();

    if (!_validateForm()) {
      return;
    }

    await ref
        .read(profileControllerProvider.notifier)
        .updateUserProfile(
          data: {
            'firstName': _firstNameController.text.trim(),
            'lastName': _lastNameController.text.trim(),
            'age': int.parse(_ageController.text.trim()),
            'gender': _gender,
            'height': double.parse(_heightController.text.trim()),
            'activityLevel': _activityLevel,
            'foodVibe': _foodVibe,
            'mainGoal': _mainGoal,
            'result': _result,
            'training': _training,
          },
          profileImage: _profileImage,
        );
  }

  bool _validateForm() {
    if (!_formKey.currentState!.validate()) {
      return false;
    }

    if (_gender == null) {
      _showValidationSnack('Please select your gender.');
      return false;
    }

    if (_activityLevel == null) {
      _showValidationSnack('Please select your activity level.');
      return false;
    }

    if (_foodVibe == null) {
      _showValidationSnack('Please select your food preference.');
      return false;
    }

    if (_mainGoal == null) {
      _showValidationSnack('Please select your main goal.');
      return false;
    }

    if (_result == null) {
      _showValidationSnack('Please select your desired result.');
      return false;
    }

    if (_training == null) {
      _showValidationSnack('Please select your training frequency.');
      return false;
    }

    final age = int.tryParse(_ageController.text.trim());

    if (age == null || age <= 0) {
      _showValidationSnack('Please enter a valid age.');
      return false;
    }

    final height = double.tryParse(_heightController.text.trim());

    if (height == null || height <= 0) {
      _showValidationSnack('Please enter a valid height.');
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
    final apiState = state.updateProfileState;

    ref.listen(profileControllerProvider, (previous, next) async {
      if (next.updateProfileState.status == ProfileApiStatus.success &&
          previous?.updateProfileState.status != ProfileApiStatus.success) {
        await ref.read(profileControllerProvider.notifier).loadProfile();

        if (!mounted) {
          return;
        }

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Profile updated successfully.'),
            behavior: SnackBarBehavior.floating,
          ),
        );

        Navigator.of(context).pop();
      }

      if (next.updateProfileState.status == ProfileApiStatus.failure &&
          previous?.updateProfileState.status != ProfileApiStatus.failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              next.updateProfileState.errorMessage ??
                  'Unable to update profile.',
            ),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile'), centerTitle: false),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
            children: [
              _buildProfileImage(),
              const SizedBox(height: 30),

              _buildSectionHeader(
                icon: Icons.person_outline,
                title: 'Personal Information',
                subtitle: 'Keep your basic information up to date.',
              ),
              const SizedBox(height: 16),

              _textField(
                controller: _firstNameController,
                label: 'First name',
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 16),

              _textField(
                controller: _lastNameController,
                label: 'Last name',
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: _textField(
                      controller: _ageController,
                      label: 'Age',
                      icon: Icons.cake_outlined,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: _dropdown(
                      label: 'Gender',
                      value: _gender,
                      options: _genderOptions,
                      icon: Icons.wc_outlined,
                      onChanged: (value) {
                        setState(() => _gender = value);
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              _buildSectionHeader(
                icon: Icons.monitor_weight_outlined,
                title: 'Body & Activity',
                subtitle: 'Tell us about your current lifestyle.',
              ),
              const SizedBox(height: 16),

              _textField(
                controller: _heightController,
                label: 'Height',
                icon: Icons.height,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                suffixText: 'cm',
              ),
              const SizedBox(height: 16),

              _dropdown(
                label: 'Activity Level',
                value: _activityLevel,
                options: _activityOptions,
                icon: Icons.directions_run_outlined,
                onChanged: (value) {
                  setState(() => _activityLevel = value);
                },
              ),

              const SizedBox(height: 30),

              _buildSectionHeader(
                icon: Icons.restaurant_outlined,
                title: 'Nutrition & Goals',
                subtitle: 'Customize your preferences and goals.',
              ),
              const SizedBox(height: 16),

              _dropdown(
                label: 'Food Preference',
                value: _foodVibe,
                options: _foodVibeOptions,
                icon: Icons.restaurant_outlined,
                onChanged: (value) {
                  setState(() => _foodVibe = value);
                },
              ),
              const SizedBox(height: 16),

              _dropdown(
                label: 'Main Goal',
                value: _mainGoal,
                options: _mainGoalOptions,
                icon: Icons.flag_outlined,
                onChanged: (value) {
                  setState(() => _mainGoal = value);
                },
              ),
              const SizedBox(height: 16),

              _dropdown(
                label: 'Desired Result',
                value: _result,
                options: _resultOptions,
                icon: Icons.track_changes_outlined,
                onChanged: (value) {
                  setState(() => _result = value);
                },
              ),
              const SizedBox(height: 16),

              _dropdown(
                label: 'Training Frequency',
                value: _training,
                options: _trainingOptions,
                icon: Icons.fitness_center_outlined,
                onChanged: (value) {
                  setState(() => _training = value);
                },
              ),

              const SizedBox(height: 32),

              SizedBox(
                height: 54,
                child: FilledButton(
                  onPressed: apiState.isLoading ? null : _submit,
                  child: apiState.isLoading
                      ? const SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text(
                          'Save Changes',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 12),

              Text(
                'Your changes will be saved to your profile.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Center(
      child: GestureDetector(
        onTap: _pickImage,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 58,
              backgroundImage: _profileImage != null
                  ? FileImage(_profileImage!)
                  : null,
              child: _profileImage == null
                  ? const Icon(Icons.person_outline, size: 54)
                  : null,
            ),
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  width: 3,
                ),
              ),
              child: Icon(
                Icons.camera_alt_outlined,
                size: 18,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: Theme.of(
              context,
            ).colorScheme.primary.withValues(alpha: 0.10),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Theme.of(context).colorScheme.primary),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 3),
              Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ],
    );
  }

  Widget _textField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    String? suffixText,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return '$label is required';
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        suffixText: suffixText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
        filled: true,
      ),
    );
  }

  Widget _dropdown({
    required String label,
    required String? value,
    required List<_SelectOption> options,
    required IconData icon,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      initialValue: value,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
        filled: true,
      ),
      items: options
          .map(
            (option) => DropdownMenuItem<String>(
              value: option.value,
              child: Text(option.label),
            ),
          )
          .toList(),
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$label is required';
        }

        return null;
      },
    );
  }
}

class _SelectOption {
  const _SelectOption({required this.value, required this.label});

  final String value;
  final String label;
}
