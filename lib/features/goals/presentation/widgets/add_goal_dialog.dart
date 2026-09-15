import 'package:flutter/material.dart';

class AddGoalDialog extends StatefulWidget {
  const AddGoalDialog({
    super.key,
    this.initialTitle,
    this.title = 'Create Goal',
    this.buttonText = 'Create',
  });

  final String? initialTitle;
  final String title;
  final String buttonText;

  @override
  State<AddGoalDialog> createState() => _AddGoalDialogState();
}

class _AddGoalDialogState extends State<AddGoalDialog> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController(text: widget.initialTitle ?? '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final title = _controller.text.trim();

    if (title.isEmpty) {
      return;
    }

    Navigator.of(context).pop(title);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: TextField(
        controller: _controller,
        autofocus: true,
        textInputAction: TextInputAction.done,
        onSubmitted: (_) => _submit(),
        decoration: const InputDecoration(
          labelText: 'Goal title',
          hintText: 'Enter your goal',
          border: OutlineInputBorder(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        FilledButton(onPressed: _submit, child: Text(widget.buttonText)),
      ],
    );
  }
}
