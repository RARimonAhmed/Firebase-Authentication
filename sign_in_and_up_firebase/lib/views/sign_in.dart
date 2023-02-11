import 'package:flutter/material.dart';
import 'package:sign_in_and_up_firebase/views/home_page.dart';
import 'package:sign_in_and_up_firebase/views/sign_up.dart';
import 'package:sign_in_and_up_firebase/widgets/sign_in_and_up_ui.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SignInAndLoginUI(
          btnText: 'Sign In',
          hText: 'Login',
          onpressed1: () => const HomePage(),
          onpressed2: () => const Registration(),
          richText1: 'Already register',
          richText2: 'Login',
        ),
      ),
    );
  }
}
