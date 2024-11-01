class Message {
  final String imagePath;
  final String title;
  final String description;
  final int? messageNumber;

  Message({
    required this.imagePath,
    required this.title,
    required this.description,
    this.messageNumber,
  });
}
