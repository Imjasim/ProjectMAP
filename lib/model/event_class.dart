class Event  {
  String eventName;
  String venue ;
  String time ;
  String description  ;

  Event(this.eventName, this.venue, this.time, this.description );
  Event.copy(Event from) : this(from.eventName, from.venue, from.time, from.description);
}