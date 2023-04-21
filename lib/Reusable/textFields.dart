import 'package:flutter/material.dart';
import '../Color/praanaColor.dart';
import '../Welcome/WelcomePage.dart';

Widget textField (bool isPasswordType,String? name,String hint,final control){
  return SizedBox(
    width: width * .8,
    child: TextField(
      controller: control,
      obscureText: isPasswordType,
      style: const TextStyle(fontSize: 13),
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: name,
          labelStyle: TextStyle(
              fontSize: 17, color: theme, letterSpacing: .2),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide(color: theme, width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide(color: theme, width: 2)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide(color: theme, width: 2)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide(color: theme, width: 2)),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.black)),
        maxLength: checklen(hint),
        keyboardType: isPasswordType
            ? TextInputType.visiblePassword
            : check(hint)
    ),
  );
}

int? checklen(String hint)
{
  if(hint == "Phone Number")
  {
    return 10;
  }
  else
    {
      return null;
    }
}

TextInputType check(String hint)
{
  if(hint == "Phone Number")
    {
      return TextInputType.phone;
    }
  else if(hint == "Email")
    {
      return TextInputType.emailAddress;
    }
  else{
    return TextInputType.text;
  }
}