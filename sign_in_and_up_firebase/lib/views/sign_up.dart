import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_and_up_firebase/views/home_page.dart';
import 'package:sign_in_and_up_firebase/views/sign_in.dart';

import '../widgets/sign_in_and_up_ui.dart';

FirebaseAuth? firebaseAuthUser;

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SignInAndLoginUI(
          btnText: 'Sign Up',
          hText: 'Registration',
          onpressed1: () => const HomePage(),
          onpressed2: () => const SignIn(),
          richText1: 'Don\'t have an account',
          richText2: 'Sign In',
        ),
      ),
    );
  }
}

setData(FirebaseAuth? firebaseAuthUser) {
  firebaseAuthUser = firebaseAuthUser;
}
