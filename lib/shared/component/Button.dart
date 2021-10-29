
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget DefaultButton(
    {
      double width = double.infinity,
      Color text_color =  Colors.white,
      FontWeight text_font_weight = FontWeight.bold,
      required VoidCallback controll,
      required String text,
      double radius = 0.0}
    )=>  Container(
  width: width,
  decoration: BoxDecoration(color: Colors.blueGrey,borderRadius: BorderRadius.circular(radius)),
  clipBehavior: Clip.antiAliasWithSaveLayer,
  child: MaterialButton(
      onPressed: controll ,
      child: Text(
        '$text',
        style: TextStyle(
            color: text_color, fontWeight: text_font_weight),
      )),
);