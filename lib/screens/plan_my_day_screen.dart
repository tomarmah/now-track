import 'package:flutter/material.dart';

class PlanMyDayScreen extends StatelessWidget {
  const PlanMyDayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plan My Day'),
      ),
      body: const Center(
        child: Text('Plan My Day Screen'),
      ),
    );
  }
}
