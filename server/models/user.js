const mongoose = require("mongoose");

const userSchema = new mongoose.Schema({
    name:{
        type:String,
        required:true,
        trim:true,
    },
    email:{
        type:String,
        required:true,
        validate:{
            validator: (val)=>{
                const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|.(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                return val.match(re);           
            },
            message:"Please enter a valid email"
        },
        
    },
    password:{
        type:String,
        required:true,
        trim: true,
        validate:{
            validator: (val)=>{
               
                return val.length >= 6;           
            },
            message:"Password must be minimum of 6 characters"
        },
    },
    address:{
        type:String,
        default:""
    },
    type:{
        type:String,
        default:"user"
    }
});

const User = mongoose.model("User",userSchema);
module.exports = User;