const database = require("../database.js");

// Here, we are implementing the class with Singleton design pattern

class EventModel {
  constructor() {
    if (this.instance) return this.instance;
    EventModel.instance = this;
  }

  get() {
    return database.getList("Event");
  }

  getById(id) {
    return database.get("Event", id);
  }

  create(event) {
    return database.create("Event", event);
  }

  delete(id) {
    return database.delete("Event", id);
  }

  update(id, event) {
    return database.set("Event", id, event);
  }
}

module.exports = new EventModel();
