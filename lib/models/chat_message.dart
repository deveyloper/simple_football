class ChatMessage {
  String from;
  String text;

  ChatMessage({this.from, this.text});

  Map<String, dynamic> toJson() => {
        'from': from,
        'text': text,
        'timespan': DateTime.now().millisecondsSinceEpoch
      };
}
