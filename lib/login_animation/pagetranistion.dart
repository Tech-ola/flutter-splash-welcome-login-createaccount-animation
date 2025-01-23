import 'package:flutter/material.dart';

class PageTransition extends PageRouteBuilder {
  final Widget route;
   PageTransition({required this.route}) : super(

      pageBuilder: (context, animation, secondaryanimation){
            return route;
          },

          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,);
          },
   );

  
}