class EventModel {
  final String title;
  final DateTime startTime;
  final String calenderType;
  final List<String> participants;

  EventModel(
      {required this.title,
        required this.startTime,
        required this.calenderType,
        required this.participants});
}