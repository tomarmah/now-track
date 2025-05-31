import 'package:flutter/material.dart';

class PostSessionAnnotationModal extends StatefulWidget {
  const PostSessionAnnotationModal({Key? key}) : super(key: key);

  @override
  State<PostSessionAnnotationModal> createState() =>
      _PostSessionAnnotationModalState();
}

class _PostSessionAnnotationModalState
    extends State<PostSessionAnnotationModal> {
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Annotate Session'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _commentController,
              decoration: const InputDecoration(
                labelText: 'Add a note',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Implement audio recording/upload
              },
              icon: const Icon(Icons.mic),
              label: const Text('Record/Upload Audio'),
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Implement video recording/attachment
              },
              icon: const Icon(Icons.videocam),
              label: const Text('Record/Attach Video'),
            ),
            const SizedBox(height: 16),
            // TODO: Implement category selector
            ElevatedButton(
              onPressed: () {
                // TODO: Save annotation and close modal
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
