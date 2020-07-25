class Event  {
  String id;
  String eventName;
  String venue ;
  String time ;
  String description  ;

  Event(this.id, this.eventName, this.venue, this.time, this.description );
  Event.copy(Event from) : this(from.id, from.eventName, from.venue, from.time, from.description);

  Event.fromJson(Map<String, dynamic> json)
      : this(
             json['id'], json['eventName'], json['venue'], json['time'], json['description']
            );

  Map<String, dynamic> toJson() =>
      {'id': id, 'eventName': eventName, 'venue': venue, 'time': time, 'description': description};
}