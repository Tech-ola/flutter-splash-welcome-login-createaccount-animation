import 'package:animation_tutorial/theme/color.dart';
import 'package:animation_tutorial/theme/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isClicked = true;
  bool isCheckedBox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFf3f0ed),
        title: const Text(
          "Log in",
          style: TextStyle(
            fontSize: Sizes.normal + 2,
            color: TextColors.textblack,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        automaticallyImplyLeading: false, // Prevent default back button rendering
      ),

      body:  Container(
        height: 812,
          decoration: BoxDecoration(
    gradient: RadialGradient(
      colors: [
        Color(0xFFe0dcd7), // Dark gray for the circular middle
        Color(0xFFf3f0ed), // Light gray for the surrounding
      ],
      radius: 0.8, // Adjust the radius to control the size of the circular area
      center: Alignment.center, // Ensure the circle is at the center of the container
    ),
  
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 48, horizontal: 27),
            child: Column(children: [
        
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(color: TextColors.textblack, fontSize: 12),
                        hintText: "Enter your email address",
                        hintStyle: TextStyle(color: TextColors.textgrey, fontSize: 12),
                        enabled: true,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: TextColors.maincolor, width: 2.0),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: TextColors.textgrey, width: 1.0), // Normal state
                          ),
                          
                        
                      ),
                    ),
        
        
                    SizedBox(height: 32,),
                    TextFormField(
                      obscureText: isClicked,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: const TextStyle(color: TextColors.textblack, fontSize: 12),
                        hintText: "Enter your password",
                        hintStyle: TextStyle(color: TextColors.textgrey, fontSize: 12),
                        enabled: true,
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: TextColors.maincolor, width: 2.0),
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: TextColors.textgrey, width: 1.0), // Normal state
                          ),
                        suffixIcon: IconButton(onPressed: (){
                          setState(() {
                            isClicked = !isClicked;
                          });
        
                        }, icon: isClicked ? Icon(Icons.visibility)  : Icon(Icons.visibility_off))
                        
                      ),
                    ),

                    SizedBox(height: 24,),

                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isCheckedBox = !isCheckedBox;
                                });
                              },
                              child: isCheckedBox ? Icon(Icons.check_box) :Icon(Icons.check_box_outline_blank)),
                            SizedBox(width: 2,),
                            Text("Remember me", style: TextStyle(color: TextColors.textgrey, fontSize: Sizes.small),),
                          ],
                        ),
                        Text("Forgot Password?", style: TextStyle(color: TextColors.maincolor, fontSize: Sizes.small),),
                      ],
                    )
        
                  ],
                ),
              ),

             const SizedBox(height: 40,),

               Container(  
                            height: 48,
                            width: 321,
                            decoration: BoxDecoration(
                              color: TextColors.maincolor,
                              borderRadius: BorderRadius.circular(48),
                          
                            ),
                            child: Center(child: const Text("Login", style: TextStyle(color: TextColors.textwhite, fontSize: (Sizes.normal)),)),
                            
                          ),

                const SizedBox(height: 40,),

               
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/Illustrations/arrow.png"),
                    SizedBox(width: Sizes.extralarge,),
                    Text("or continue with", style: TextStyle(fontSize: Sizes.small, color: TextColors.textgrey),),
                    SizedBox(width: Sizes.extralarge,),
                    Image.asset("assets/Illustrations/arrow.png"),
                  ],
                ),

                 SizedBox(height: 20,),

                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/Illustrations/google.png"),
                    SizedBox(width: 24,),
                    Image.asset("assets/Illustrations/facebook.png"),
                    SizedBox(width: 24,),
                    Image.asset("assets/Illustrations/apple.png"),
                  ],
                ),
        
        
              
            ],),
          ),
        ),
      ),
    );
  }
}