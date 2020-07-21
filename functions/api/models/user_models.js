const database = require("../database.js");

// Here, we are implementing the class with Singleton design pattern

class UserModel {
  constructor() {
    if (this.instance) return this.instance;
    UserModel.instance = this;
  }

  get() {
    return database.getList("User");
  }

  getById(id) {
    return database.get("User", id);
  }

  create(user) {
    return database.create("User", user);
  }

  delete(id) {
    return database.delete("User", id);
  }

  update(id, user) {
    return database.set("User", id, user);
  }
}

module.exports = new UserModel();
