import 'package:flutter/material.dart';
import 'package:sign_in_and_up_firebase/views/sign_in.dart';
import 'package:sign_in_and_up_firebase/widgets/sign_in_and_up_ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SignInAndLoginUI(
          btnText: 'Sign Up',
          hText: 'Registration',
          onpressed1: () => const SignIn(),
          onpressed2: () => const SignIn(),
          richText1: 'Don\'t have an account',
          richText2: 'Sign Up',
        ),
      ),
    );
  }
}
