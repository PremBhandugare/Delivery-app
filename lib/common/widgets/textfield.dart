import 'package:bigthing/constants/global.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget{
  final TextEditingController controller ;
  final String hinttext ;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hinttext,
    });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
       controller: controller,
       decoration: InputDecoration(
        hintText: hinttext,
        filled: true,
        fillColor: GlobalVariables.backgroundColor,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          ),
        ),
       ),
       validator: (value) {
         
       },
    );
  }
}