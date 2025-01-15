const express = require('express');
const mongoose = require('mongoose');
const authRouter = require("./routes/auth");

const port = 3000;
const app = express();
const DB = "mongodb+srv://prembhandugare:prem1234@cluster0.q75ki.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0"

app.use(express.json());
app.use(authRouter);

mongoose
  .connect(DB)
  .then(()=>{
        console.log("Connected to the database");
   })
   .catch((err)=>{
        console.log("Error connecting to the database",err);
    });

app.listen(port,"0.0.0.0",()=>{
    console.log(`Connected at port ${port} `);
});