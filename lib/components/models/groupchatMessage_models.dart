class GCMessage {
  final String? text;
  final bool isSentByMe;
  final bool messageTypeAudio;
  final String senderName;
  final String senderDp;

  final String? media;

  final DateTime date;

  GCMessage(
      {required this.text,
      required this.isSentByMe,
      required this.date,
      required this.senderDp,
      required this.senderName,
      required this.media,
      required this.messageTypeAudio});
}

List<GCMessage> gcmsg = [
  GCMessage(
      text:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet, temApor, non lorem justo tellus et, quisque euismod. Velit amet malesuada proin sed tortor tortor.',
      isSentByMe: false,
      date: DateTime.now().subtract(Duration(minutes: 1)),
      media: null,
      senderDp: 'Assets/john.png',
      senderName: 'John Mac',
      messageTypeAudio: false),
  GCMessage(
      text:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet, tempor, non lorem justo tellus et, quisque euismod. Velit amet malesuada proin sed tortor tortor.',
      isSentByMe: false,
      date: DateTime.now().subtract(Duration(minutes: 1)),
      media: null,
      senderDp: 'Assets/vera.png',
      senderName: 'Vera McBerth',
      messageTypeAudio: false),
  GCMessage(
      text:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet, tempor, non lorem justo tellus et, quisque euismod. Velit amet malesuada proin sed tortor tortor.',
      isSentByMe: true,
      date: DateTime.now().subtract(Duration(minutes: 1)),
      media: null,
      senderDp: 'Assets/gcdp.png',
      senderName: '',
      messageTypeAudio: false),
  GCMessage(
      text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      isSentByMe: false,
      date: DateTime.now().subtract(Duration(minutes: 1)),
      media: null,
      senderDp: 'Assets/bethie.png',
      senderName: 'Mary Jane',
      messageTypeAudio: false),
  GCMessage(
      text:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet, tempor, non lorem justo tellus et, quisque euismod. Velit amet malesuada proin sed tortor tortor.',
      isSentByMe: false,
      date: DateTime.now().subtract(Duration(minutes: 1)),
      media: 'Assets/chatimg.png',
      senderDp: 'Assets/vera.png',
      senderName: 'Vera McBerth',
      messageTypeAudio: false),
  GCMessage(
      text: '',
      isSentByMe: false,
      date: DateTime.now().subtract(Duration(minutes: 1)),
      media: null,
      senderDp: 'Assets/john.png',
      senderName: 'John Mac',
      messageTypeAudio: true),
];
