const functions = require('firebase-functions');

const express = require("express");
const db = require("./api/database.js");
const app = express();
const sellingRouter = require("./api/controllers/selling_controller.js");
const eventRouter = require("./api/controllers/event_controller.js");
const confessionRouter = require("./api/controllers/confession_controller.js");


app.use(express.json());
app.use("/selling", sellingRouter);

app.use("/event", eventRouter);

app.use("/confession", confessionRouter);

/*app.get("/tod", (req, res, next) =>
  res.json({ message: "Get a list of todos" })
);*/
  
  exports.api = functions.https.onRequest(app);
  
  // To handle "Function Timeout" exception
  exports.functionsTimeOut = functions.runWith({
    timeoutSeconds: 300,
  });

  exports.setupdb = functions.https.onRequest(require("./setup_database"))    