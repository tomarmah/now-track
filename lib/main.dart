import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nowtrack/models/activity.dart'; // Import Activity model
import 'package:nowtrack/screens/home_screen.dart';
import 'package:nowtrack/screens/timeline_screen.dart';
import 'package:nowtrack/screens/plan_my_day_screen.dart';
import 'package:nowtrack/screens/reports_screen.dart';
import 'package:nowtrack/screens/category_manager_screen.dart';
import 'package:nowtrack/screens/settings_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ActivityAdapter());
  runApp(const NowTrackApp());
}

class NowTrackApp extends StatelessWidget {
  const NowTrackApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NowTrack',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      routes: {
        '/timeline': (context) => const TimelineScreen(),
        '/plan_my_day': (context) => const PlanMyDayScreen(),
        '/reports': (context) => const ReportsScreen(),
        '/category_manager': (context) => const CategoryManagerScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}
