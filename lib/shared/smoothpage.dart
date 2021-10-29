import 'package:flutter/material.dart';
Widget smooth(int x,int y)

{
return  CircleAvatar(radius: 5,backgroundColor: x!=y? Colors.grey :Colors.black,);
}
