import 'dart:convert';

import 'package:bigthing/constants/error.dart';
import 'package:bigthing/constants/global.dart';
import 'package:bigthing/constants/utils.dart';
import 'package:bigthing/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class AuthService {

  void signUp({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  })async{
    try {
      User user = User(
        id: '',
        email: email,
        name: name,
        password: password,
        address: '',
        type: '',
        token: '',
      );

      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers:<String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        res: res, 
        context: context, 
        onSuccess: (){
          showSnackbar(
            context: context, 
            message: 'Sign up successfully'
          );
        }
      );

    } catch (e) {
      showSnackbar(
        context: context, 
        message: e.toString()
      );
    }
  }


  void signIn({
    required BuildContext context,
    required String email,
    required String password,
  })async{
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({
          'email':email,
          'password':password,
        }),
        headers:<String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(res.body);
      httpErrorHandle(
        res: res, 
        context: context, 
        onSuccess: ()async{
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('auth-token',jsonDecode(res.body)['token']);

        }
      );

    } catch (e) {
      showSnackbar(
        context: context, 
        message: e.toString()
      );
    }
  }  

}