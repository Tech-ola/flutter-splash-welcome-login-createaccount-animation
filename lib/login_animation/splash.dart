import 'dart:async';

import 'package:animation_tutorial/login_animation/pagetranistion.dart';
import 'package:animation_tutorial/login_animation/welcome.dart';
import 'package:animation_tutorial/theme/color.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation<double> progressbar;
  late Animation<double> scaletransition;
  bool isLoaded = false;


  @override
  void initState() {
    // TODO: implement initState

    controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));

    progressbar = Tween<double>(begin: 0, end: 180).animate(CurvedAnimation(parent: controller, curve: const Interval(0.0, 0.5))); 

    scaletransition = Tween<double>(begin: 0, end: 10).animate(CurvedAnimation(parent: controller, curve: const Interval(0.5, 1.0)));

    progressbar.addStatusListener((status) {
      if(status == AnimationStatus.completed){

       Navigator.of(context).push(
        PageTransition(route: const WelcomePage())
       );

        Timer(Duration(milliseconds: 1000), () { 
              controller.reset();
            });
      }
    });

  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        setState(() {
          isLoaded = !isLoaded;
          controller.forward();
        });
      },
      child: Scaffold(
        backgroundColor: Color(0xFFFFac80),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("your", style: TextStyle(fontSize: 35, color: TextColors.textwhite, fontWeight: FontWeight.bold),),
                   Text("brand", style: TextStyle(fontSize: 35, color: TextColors.textblack , fontWeight: FontWeight.bold))
                ],
              ),
              const SizedBox(height: 10,),
      
             
             AnimatedBuilder(
              animation: progressbar,
      
               builder: (context, child) {
                 return Stack(
                  children: [
                     Container(
                    width: 180,
                    height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Color(0xFFE6EFEA)
                    ),
                  ),
                 
                    Container(
                      width: progressbar.value,
                      height: 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Color(0xFFFFFFFF)
                      ),
                    ),
                  ],
                 );
               }
             ),
             
            
            isLoaded
                  ? ScaleTransition(
                      scale: scaletransition,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: TextColors.textwhite,
                        ),
                      ),
                    )
                  : const SizedBox(width: 100, height: 100),
            ],
          ),
        ),

        
      
      ),
    );
  }
}
