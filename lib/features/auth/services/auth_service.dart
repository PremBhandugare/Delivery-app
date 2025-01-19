import 'package:bigthing/constants/error.dart';
import 'package:bigthing/constants/global.dart';
import 'package:bigthing/constants/utils.dart';
import 'package:bigthing/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
}