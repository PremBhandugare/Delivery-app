const express = require('express');
const User = require("../models/user");
const bcryptjs = require("bcryptjs");
const authRouter = express.Router();
const jwt = require('jsonwebtoken');

//Signup
authRouter.post("/api/signup",async (req,res)=>{
    try{
        const {name,email,password} = req.body;

    const existingUser = await User.findOne({ email });

    if(existingUser){
        //400 means client error
        return res.status(400).json({msg:"Email already exists"});
    }

    const hashedpass = await bcryptjs.hash(password,8);

    let user = new User({
        name,
        email,
        password : hashedpass
    });
    user = await user.save();
    res.json(user);
    }
    catch(err){
        res.status(500).json({error:err.message});
    }
})

//Sign-in
authRouter.post('/api/signin', async (req,res)=>{
    try {
        const {email,password} = req.body;
        const user = await User.findOne({email});
        if (!user) {
            return res
            .status(400)
            .json({msg:"User with this email does not exist"});
        }

        const isMatch = await bcryptjs.compare(password,user.password)
        if (!isMatch) {
            return res
            .status(400)
            .json({msg:"Incorrect password"})
        }
        
        const token = jwt.sign({id: user._id},"passwordKey");
        res.json({token, ...user._doc})

    } catch (error) {
        res.status(500).json({error: error.message});
    }

});

module.exports = authRouter;