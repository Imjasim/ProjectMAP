const database = require("../database.js");

// Here, we are implementing the class with Singleton design pattern

class SellingModel {
  constructor() {
    if (this.instance) return this.instance;
    SellingModel.instance = this;
  }

  get() {
    return database.getList("Selling");
  }

  getById(id) {
    return database.get("Selling", id);
  }

  create(sell) {
    return database.create("Selling", sell);
  }

  delete(id) {
    return database.delete("Selling", id);
  }

  update(id, sell) {
    return database.set("Selling", id, sell);
  }
}

module.exports = new SellingModel();
