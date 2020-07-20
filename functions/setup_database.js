const db = require("./api/database.js");

async function setupDatabase(req, res, next) {
  // To delete all the collections
  const collections = ["users", "Selling"];
  collections.forEach(async (collection) => await deleteCollection(collection));

  // Add documents to the todos collection
  addDocuments("Selling", [
    { prodName: "Chocolate Ball", prodPrice: "RM5 /100g", prodDesc: "Almond coated with delicious  chocolates" },
    { prodName: "Parker Pen", prodPrice: "RM 50.00", prodDesc: "Classic pen ,convenient to write and must to be own one s" },
  ]);

  res.send("Setting Up Database.... Done ");
}

async function deleteCollection(collection) {
  const cref = db.firestore.collection(collection);
  const docs = await cref.listDocuments();
  docs.forEach((doc) => doc.delete());
}

function addDocuments(collection, docs) {
  docs.forEach((doc) => db.create(collection, doc));
}

module.exports = setupDatabase;
