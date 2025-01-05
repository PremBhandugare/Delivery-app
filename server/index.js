const express = require('express');

const authRouter = require("./routes/auth");



const port = 5000;
const app = express();

app.listen(port,"0.0.0.0",()=>{
    console.log(`Connected at port ${port} `);
});