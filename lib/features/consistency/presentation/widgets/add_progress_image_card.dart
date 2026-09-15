import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProgressImageCard extends StatefulWidget {
  final Future<bool> Function(String imagePath) onUpload;

  const AddProgressImageCard({super.key, required this.onUpload});

  @override
  State<AddProgressImageCard> createState() => _AddProgressImageCardState();
}

class _AddProgressImageCardState extends State<AddProgressImageCard> {
  final ImagePicker _picker = ImagePicker();

  bool _isUploading = false;

  Future<void> _pickImage() async {
    final image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );

    if (image == null) {
      return;
    }

    setState(() {
      _isUploading = true;
    });

    try {
      final success = await widget.onUpload(image.path);

      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            success
                ? 'Progress image uploaded successfully.'
                : 'Unable to upload progress image.',
          ),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isUploading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Progress Images',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            const Text('Upload an image to track your progress.'),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _isUploading ? null : _pickImage,
                icon: _isUploading
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.photo_library_outlined),
                label: Text(_isUploading ? 'Uploading...' : 'Upload Image'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
