class DailyScore {
  final DateTime date;
  final Map<String, double> actualBreakdown;
  final double score;
  final String grade;

  DailyScore({
    required this.date,
    required this.actualBreakdown,
    required this.score,
    required this.grade,
  });
}
