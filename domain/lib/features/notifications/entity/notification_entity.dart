class NotificationEntity {
  final String time;
  final String content;
  final int id;
  final String timeMark;
  final String isRead;

  const NotificationEntity({
    required this.content,
    required this.time,
    required this.timeMark,
    required this.id,
    required this.isRead,
  });
}
