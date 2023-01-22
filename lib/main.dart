import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FlashChat());
}

class FlashChat extends StatelessWidget {
  const FlashChat({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:
          WelcomeScreen.id, // id is now associated with welcomescreen class
      // we did not need to create a WelcomeScreen() object by using static modifier on id
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        // if we used named routes in flutter documenation we will
        // First route as '/' is compulsory
        // like in this the named routes will be '/', '/chatscreen', '/loginscreen'
        // and '/registrationscreen'
      },
    );
  }
}
