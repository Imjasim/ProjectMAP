const database = require("../database.js");

// Here, we are implementing the class with Singleton design pattern

class ConfessionModel {
  constructor() {
    if (this.instance) return this.instance;
    ConfessionModel.instance = this;
  }

  get() {
    return database.getList("Confession");
  }

  getById(id) {
    return database.get("Confession", id);
  }

  create(confession) {
    return database.create("Confession", confession);
  }

  delete(id) {
    return database.delete("Confession", id);
  }

  update(id, confession) {
    return database.set("Confession", id, confession);
  }
}

module.exports = new ConfessionModel();
