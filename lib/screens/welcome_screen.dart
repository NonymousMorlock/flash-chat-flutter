import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id =
      'welcome_screen'; //Static is a modifier it is used to modify a variable so that its now associated with the class.
  WelcomeScreen({Key? key}) : super(key: key);
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  // SingleTickerProviderStateMixin act as a ticker for single animation if we had multiple animation we have used TickerProviderStateMixin
  // Mixins increases the capability of our class
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    // controller = AnimationController(
    //   // AnimationController will animate the number and number goes from 0 to 1
    //   duration: Duration(seconds: 1),
    //   upperBound: 100.0,
    //   vsync: // vsync is a required property for AnimationController
    //       this, // this is where we provide the ticker provider in this case _WelcomeScreenState is the ticker provider
    // );

    controller = AnimationController(
      // the value of upper bound for CurvedAnimation will be 1 so we have not specified upper bound
      duration: Duration(seconds: 1),
      vsync: this,
    );

    // animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller); // Tween Animation

    controller.forward(); // this is going to proceed our animations forward

    // animation.addStatusListener((status) { // this whole code helps to change the logo back and fro
    //   //print(status);
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse(from: 1.0);
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });

    controller.addListener(() {
      // to see what controller is doing we have to add a Listner to it

      setState(
          () {}); // we have used set state to make our controller dirty we did not need to enter inside it because our value is already changing with AnimationController
      // UI does not update when controller's value changed.
      // So this code listens for that changes and explicitly calls setState to update the UI.
    });
  }

  @override
  void dispose() {
    controller
        .dispose(); // when _WelcomeScreenState is going to be destroyed we make sure that we dispose our controller so this way
    // it does not stay up in the memory and hogging resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red.withOpacity(controller.value),
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      height: 60.0,
                      // height: animation.value *
                      // 100, // we haver multiplied by hundred because value of animation.value is between 0 to 1 so it does not have a significant height we can see
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                ),
                DefaultTextStyle(
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [TypewriterAnimatedText('FLASH CHAT')],
                    //'${controller.value.toInt()}%',
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundedButton(
                color: Colors.blue,
                title: 'Log In',
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                }),
            RoundedButton(
                color: Colors.blueAccent,
                title: 'Register',
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                }),
          ],
        ),
      ),
    );
  }
}
