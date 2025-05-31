import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'category.g.dart';

@HiveType(typeId: 1) // Use a different typeId than Activity
class Category {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final int iconCodePoint; // Store icon as code point
  @HiveField(3)
  final int colorValue; // Store color as int

  Category({
    required this.id,
    required this.name,
    required this.iconCodePoint,
    required this.colorValue,
  });

  // Helper getters to convert stored values back to IconData and Color
  IconData get icon => IconData(iconCodePoint, fontFamily: 'MaterialIcons');
  Color get color => Color(colorValue);
}
