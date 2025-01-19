import 'dart:convert';

import 'package:bigthing/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
  required http.Response res,
  required BuildContext context,
  required Function onSuccess,
}) {
  switch(res.statusCode){
    case 200:
    onSuccess();
    break;

    case 400:
    showSnackbar(
      context: context, 
      message:jsonDecode(res.body)['message']
    );
    break;

    case 500:
    showSnackbar(
      context: context, 
      message:jsonDecode(res.body)['error']
    );
    break;

    default:
    showSnackbar(
      context: context, 
      message:'Something went wrong'
    );
  }
}
