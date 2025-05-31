import 'package:flutter/material.dart';

class CategoryManagerScreen extends StatelessWidget {
  const CategoryManagerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category Manager'),
      ),
      body: const Center(
        child: Text('Category Manager Screen'),
      ),
    );
  }
}
