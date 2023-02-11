import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_and_up_firebase/views/sign_up.dart';
import 'package:sign_in_and_up_firebase/views/testpage.dart';

class SignInAndLoginUI extends StatefulWidget {
  final String hText, btnText, richText1, richText2;
  final Function? onpressed1, onpressed2;
  const SignInAndLoginUI({
    super.key,
    required this.hText,
    required this.btnText,
    required this.onpressed1,
    required this.onpressed2,
    required this.richText1,
    required this.richText2,
  });

  @override
  State<SignInAndLoginUI> createState() => _SignInAndLoginUIState();
}

class _SignInAndLoginUIState extends State<SignInAndLoginUI> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  dynamic firebaseUser;
  dynamic snackBar;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Future register() async {
    try {
      firebaseUser = await firebaseAuth.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        snackBar = const SnackBar(content: Text('Password is weak'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (e.code == 'email-already-in-use') {
        snackBar = const SnackBar(content: Text('Email is already used'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      snackBar = const SnackBar(
          content: Text('Check internet connection\n or something is wrong'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future login() async {
    try {
      firebaseUser = await firebaseAuth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'internet-connection') {
        snackBar =
            const SnackBar(content: Text('You have no internet connection'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (e.code == 'email-is-not-correct') {
        snackBar = const SnackBar(content: Text('Your email is not correct'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        snackBar = SnackBar(content: Text(e.message.toString()));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      snackBar = const SnackBar(
          content: Text('Check internet connection\nor something is wrong\n'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    setData(firebaseUser);
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            widget.hText,
            style: const TextStyle(
              color: Colors.deepPurple,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.email,
                      ),
                      hintText: 'Please enter your email',
                      labelText: 'Email',
                    ),
                  ),
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.remove_red_eye),
                      hintText: 'Enter a password',
                      labelText: 'Password',
                    ),
                    obscureText: true,
                    obscuringCharacter: '*',
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: (() {
              if (widget.hText == 'Registration') {
                register();
              } else if (widget.hText == "Login") {
                login();
              }
              if (firebaseUser != null) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => widget.onpressed1!())));
              }
            }),
            child: Text(
              widget.btnText,
              style: const TextStyle(
                color: Colors.cyanAccent,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                text: widget.richText1,
                style: const TextStyle(color: Colors.black45, fontSize: 18),
                children: <TextSpan>[
                  TextSpan(
                    text: ' ${widget.richText2}',
                    style:
                        const TextStyle(color: Colors.blueAccent, fontSize: 22),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => widget.onpressed2!())));
                      },
                  ),
                ],
              ),
            ),
          ),
          //Sign out page
          // TestWidget(firebaseAuth: firebaseAuth),
        ],
      ),
    );
  }
}
