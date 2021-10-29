import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget textformfield(  {
  required TextEditingController pass,
  required Icon prefix_icon ,
  IconData ? suffix_icon,
  required TextInputType keyboard_type,
  bool password = false,
  required String text,
  double radius = 0.0,
  FormFieldValidator<String>? validator,
  VoidCallback? suffix_hand,
  GestureTapCallback? ontap,
  Function(String)? onchange,
  Function(String)? onsubmit,
  bool? enabled


})=>                  TextFormField(
  controller: pass,
  validator: validator,
  keyboardType: keyboard_type,
  obscureText: password,
  onTap: ontap,
  onFieldSubmitted: onsubmit,
  onChanged: onchange,
  enabled: enabled ,
  decoration: InputDecoration(
    labelText: '$text',
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
    ),
    prefixIcon: prefix_icon,
    suffixIcon: IconButton(onPressed: suffix_hand, icon: Icon(suffix_icon),),

  ),
);
