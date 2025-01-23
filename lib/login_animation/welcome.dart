import 'package:animation_tutorial/login_animation/createaccount.dart';
import 'package:animation_tutorial/login_animation/login.dart';
import 'package:animation_tutorial/theme/color.dart';
import 'package:animation_tutorial/theme/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with SingleTickerProviderStateMixin {
  late Animation<Offset> slideanimation;
  late Animation<double> pageanimation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    slideanimation = Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(controller);
    pageanimation = Tween<double>(begin: 0, end: 1).animate(controller);

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient (top part)
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFF6EFE8), // Start color
                  Color(0xFFE6EFEA), // End color
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // Content and the bottom clipped container
          Column(
            children: [
              // Top section with sliding text and image
              Expanded(
                flex: 5, // Proportion of height for this section
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SlideTransition(
                      position: slideanimation,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "your",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: TextColors.textblack,
                            ),
                          ),
                          Text(
                            "brand",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: TextColors.maincolor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    FadeInImage(
                      placeholder: AssetImage("assets/Illustrations/Ilustration.png"),
                      image: AssetImage("assets/Illustrations/Ilustration.png"),
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),

              // Bottom section with ClipRRect container
              Expanded(
                flex: 3, // Proportion of height for this section
                child: ClipRRect(
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(30),
                    right: Radius.circular(30),
                  ),
                  child: Container(
                    color: TextColors.textwhite,
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Metaverse, the world",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.large),
                        ),
                        const Text(
                          "you live in.",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.large),
                        ),
                        const SizedBox(height: Sizes.extralarge),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) {
                                  return const CreateAccount();
                                },
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  const begin = Offset(0, 1);
                                  const end = Offset.zero;
                                  const curve = Curves.easeInOut;

                                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                  var offsetAnimation = animation.drive(tween);

                                  return SlideTransition(
                                    position: offsetAnimation,
                                    child: child,
                                  );
                                },
                              ),
                            );
                          },
                          child: Container(
                            height: 48,
                            width: 225,
                            decoration: BoxDecoration(
                              color: TextColors.maincolor,
                              borderRadius: BorderRadius.circular(48),
                            ),
                            child: const Center(
                              child: Text(
                                "Create a free account",
                                style: TextStyle(color: TextColors.textwhite, fontSize: Sizes.normal),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: Sizes.normal),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Have an account?",
                              style: TextStyle(fontSize: Sizes.normal, color: TextColors.textblack),
                            ),
                            const SizedBox(width: 5),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation, secondaryAnimation) {
                                      return const LoginPage();
                                    },
                                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                      const begin = Offset(0, 1);
                                      const end = Offset.zero;
                                      const curve = Curves.easeInOut;

                                      var tween =
                                          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                      var offsetAnimation = animation.drive(tween);

                                      return SlideTransition(
                                        position: offsetAnimation,
                                        child: child,
                                      );
                                    },
                                  ),
                                );
                              },
                              child: const Text(
                                "Log in",
                                style: TextStyle(fontSize: Sizes.normal, color: TextColors.maincolor),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
