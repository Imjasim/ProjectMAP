class Confession {
  String username;
  String subject;
  String content;

  Confession(this.username, this.subject, this.content);
  Confession.copy(Confession from) : this(from.username, from.subject, from.content);

  Confession.fromJson(Map<String, dynamic> json)
      : this(
             json['username'], json['subject'], json['content']
            );

  Map<String, dynamic> toJson() =>
      {'username': username, 'subject': subject, 'content': content};
}