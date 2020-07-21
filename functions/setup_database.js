const db = require("./api/database.js");

async function setupDatabase(req, res, next) {
  // To delete all the collections
  const collections = ["Selling", "Event", "Confession"];
  collections.forEach(async (collection) => await deleteCollection(collection));

  // Add documents to the todos collection
  addDocuments("Selling", [
    { prodName: "Chocolate Ball", prodPrice: "RM5 /100g", prodDesc: "Almond coated with delicious  chocolates" },
    { prodName: "Parker Pen", prodPrice: "RM 50.00", prodDesc: "Classic pen ,convenient to write and must to be own one s" },
  ]);

  addDocuments("Event", [
    { eventName: "FESKO", venue: "Padang KAWAD", 
    time: "10/10/2020-17/10/2020", description: "Fiesta Konvokesyen held in order to celebrate the students being graduated" },
    { eventName: "SUKAM", venue: "KTDI", 
    time: "15/9/2020-19/9/2020", description: "An intra-kolej sports festival which gives the students an opportunity" },
  ]);

  addDocuments("Confession", [
    { username: "Kevin", subject: "Fight at Arked Lestari", 
    content: "There was a fight between shop staff and UTM student at arked lestari due to food was served late" },
    { username: "Nabila", subject: "Misunderstanding at FC Computer Lab", 
    content: "There was a misunderstanding between lab assistant and FC student which end up both of the had to met the Dean at his office" },
  ]);

  addDocuments("User", [
    { username: "nabila", name: "NUR NABILA BINTI ZAKARIA", 
    matricno: "A17CS0159", faculty: "School of Computing", email: "nabilazakaria13@gmail.com", pnum: "60123456789" },
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
