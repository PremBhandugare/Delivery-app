const express = require('express');
const User = require("../models/user");

const authRouter = express.Router();

authRouter.post("/api/signup",async (req,res)=>{
    const {name,email,password} = req.body;

    const existingUser =await User.findOne({ email });

    if(existingUser){
        return res.status(400).json({message:"Email already exists"});
    }
})

module.exports = authRouter;