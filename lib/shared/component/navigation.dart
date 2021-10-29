

import 'package:flutter/material.dart';

void navigation_back({required BuildContext context,required Widget widget})
{
  Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));
}
void navigation({required BuildContext context,required Widget widget})
{
  Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>widget),(route)=>false );
}
void animated_navigation({required BuildContext context,required Widget widget})
{
  Navigator.push(context, Custompageroute(widget:widget ));
}

class Custompageroute extends PageRouteBuilder {
  Widget widget;
  Custompageroute({required this.widget}) : super(
    transitionDuration: Duration( seconds: 1),
    pageBuilder: (context,animation,secondaryanimation)=>widget
  );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(position:  Tween<Offset>(
      begin:Offset(0, 1)
      ,end:   Offset.zero
    ).animate(animation),child: child,

    );
  }
}

