import 'package:flutter/material.dart';

class AddWeightCard extends StatefulWidget {
  final Future<void> Function(double weight) onAdd;

  const AddWeightCard({super.key, required this.onAdd});

  @override
  State<AddWeightCard> createState() => _AddWeightCardState();
}

class _AddWeightCardState extends State<AddWeightCard> {
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isSubmitting = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final weight = double.tryParse(_controller.text.trim());

    if (weight == null) {
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      await widget.onAdd(weight);

      if (!mounted) {
        return;
      }

      _controller.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Weight added successfully.')),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add Weight',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _controller,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(
                  labelText: 'Weight',
                  hintText: 'Enter your weight',
                  suffixText: 'kg',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  final weight = double.tryParse(value?.trim() ?? '');

                  if (weight == null) {
                    return 'Enter a valid weight.';
                  }

                  if (weight <= 0) {
                    return 'Weight must be greater than 0.';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isSubmitting ? null : _submit,
                  child: _isSubmitting
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Add Weight'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
