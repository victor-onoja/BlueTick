class BCMessage {
  final String text;

  final bool messageTypeAudio;

  final String? media;

  final DateTime date;

  BCMessage(
      {required this.text,
      required this.date,
      required this.media,
      required this.messageTypeAudio});
}

List<BCMessage> broadcastmsg = [
  BCMessage(
      text:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet, tempor, non lorem justo tellus et, quisque euismod. Velit amet malesuada proin sed tortor tortor.\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Amet, tempor, non lorem justo tellus et, quisque euismod. Velit amet malesuada proin sed tortor tortor.\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Amet, tempor, non lorem justo tellus et, quisque euismod. Velit amet malesuada proin sed tortor tortor. ',
      date: DateTime.now().subtract(Duration(minutes: 1)),
      media: null,
      messageTypeAudio: false)
];
