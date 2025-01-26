import 'package:bigthing/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier{
  User _user = User(
    id: '', 
    email:'', 
    name: '', 
    password: '', 
    address: '', 
    type: '', 
    token: ''
    );
  User get user => _user;
  
}