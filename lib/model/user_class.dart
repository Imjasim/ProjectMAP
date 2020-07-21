class User {
  String username;
  String name;
  String matricno;
  String faculty;
  String email;
  String pnum;


  User(this.username, this.name, this.matricno, this.faculty, this.email, this.pnum);
  User.copy(User from) : this(from.username, from.name, from.matricno, from.faculty, from.email, from.pnum);

  User.fromJson(Map<String, dynamic> json)
      : this(
             json['username'], json['name'], json['matricno'], json['faculty'], json['email'], json['pnum']
            );

  Map<String, dynamic> toJson() =>
      {'username': username, 'name': name, 'matricno': matricno, 'faculty': faculty, 'email': email, 'pnum': pnum};
      
}