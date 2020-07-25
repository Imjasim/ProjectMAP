class Confession {
  String id;
  String username;
  String subject;
  String content;

 /*
  Confession(this.username, this.subject, this.content);
  Confession.copy(Confession from) : this(from.username, from.subject, from.content);

  Confession.fromJson(Map<String, dynamic> json)
      : this(
             json['username'], json['subject'], json['content']
            );

  Map<String, dynamic> toJson() =>
      {'username': username, 'subject': subject, 'content': content};
*/
     
      Confession(this.id, this.username, this.subject, this.content);
  Confession.copy(Confession from) : this(from.id, from.username, from.subject, from.content);

  Confession.fromJson(Map<String, dynamic> json)
      : this(
             json['id'], json['username'], json['subject'], json['content']
            );

  Map<String, dynamic> toJson() =>
      {'id': id, 'username': username, 'subject': subject, 'content': content};
      
}