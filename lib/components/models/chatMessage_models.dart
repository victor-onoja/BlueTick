class CHATMessage {
  final String? text;
  final bool isSentByMe;
  final bool messageTypeAudio;
  final String? media;
  final DateTime date;
  CHATMessage(
      {required this.text,
      required this.isSentByMe,
      required this.messageTypeAudio,
      required this.media,
      required this.date});
}

List<CHATMessage> chatmsg = [
  CHATMessage(
      text:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet, temApor, non lorem justo tellus et, quisque euismod. Velit amet malesuada proin sed tortor tortor.',
      isSentByMe: false,
      date: DateTime.now().subtract(Duration(minutes: 1)),
      media: null,
      messageTypeAudio: false),
  CHATMessage(
      text:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet, tempor, non lorem justo tellus et, quisque euismod. Velit amet malesuada proin sed tortor tortor.',
      isSentByMe: false,
      date: DateTime.now().subtract(Duration(minutes: 1)),
      media: null,
      messageTypeAudio: false),
  CHATMessage(
      text:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet, tempor, non lorem justo tellus et, quisque euismod. Velit amet malesuada proin sed tortor tortor.',
      isSentByMe: true,
      date: DateTime.now().subtract(Duration(minutes: 1)),
      media: null,
      messageTypeAudio: false),
  CHATMessage(
      text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      isSentByMe: false,
      date: DateTime.now().subtract(Duration(minutes: 1)),
      media: 'Assets/chatimg.png',
      messageTypeAudio: false),
  CHATMessage(
      text: '',
      isSentByMe: true,
      date: DateTime.now().subtract(Duration(minutes: 1)),
      media: null,
      messageTypeAudio: true),
];
