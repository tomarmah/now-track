import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nowtrack/models/activity.dart';
import 'package:uuid/uuid.dart';
import 'package:nowtrack/widgets/post_session_annotation_modal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isTracking = false;
  Activity? _currentActivity;

  @override
  void initState() {
    super.initState();
    _openBox();
  }

  Future<void> _openBox() async {
    await Hive.openBox<Activity>('activities').then((value) {
      setState(() {});
    });
  }

  Future<void> _startTracking() async {
    setState(() {
      _isTracking = true;
    });
    var uuid = const Uuid();
    final activity = Activity(
      id: uuid.v4(),
      startTime: DateTime.now(),
      categoryId: 'default', // TODO: Allow user to select category
    );
    var box = Hive.box<Activity>('activities');
    await box.add(activity);
    setState(() {
      _currentActivity = activity;
    });
  }

  Future<void> _stopTracking() async {
    setState(() {
      _isTracking = false;
    });
    if (_currentActivity != null) {
      var box = Hive.box<Activity>('activities');
      final activity = Activity(
        id: _currentActivity!.id,
        startTime: _currentActivity!.startTime,
        endTime: DateTime.now(),
        categoryId: _currentActivity!.categoryId,
        comment: _currentActivity!.comment,
        audioPath: _currentActivity!.audioPath,
        videoPath: _currentActivity!.videoPath,
      );
      await box.put(
          _currentActivity!.id, activity); // Replace with updated activity
      setState(() {
        _currentActivity = null;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const PostSessionAnnotationModal();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NowTrack'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _isTracking ? _stopTracking : _startTracking,
              child: Text(_isTracking ? 'Stop' : 'Start'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/timeline');
              },
              child: const Text('View Timeline'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/plan_my_day');
              },
              child: const Text('Plan My Day'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/reports');
              },
              child: const Text('View Reports'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/category_manager');
              },
              child: const Text('Category Manager'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
              child: const Text('Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
