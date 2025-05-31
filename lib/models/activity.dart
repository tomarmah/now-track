import 'package:hive/hive.dart';

part 'activity.g.dart';

@HiveType(typeId: 0)
class Activity {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final DateTime startTime;
  @HiveField(2)
  final DateTime? endTime;
  @HiveField(3)
  final String categoryId;
  @HiveField(4)
  final String? comment;
  @HiveField(5)
  final String? audioPath;
  @HiveField(6)
  final String? videoPath;

  Activity({
    required this.id,
    required this.startTime,
    this.endTime,
    required this.categoryId,
    this.comment,
    this.audioPath,
    this.videoPath,
  });
}
