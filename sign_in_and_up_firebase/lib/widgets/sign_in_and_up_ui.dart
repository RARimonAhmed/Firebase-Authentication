import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.email,
                      ),
                      hintText: 'Please enter your email',
                      labelText: 'Email',
                    ),
                  ),
                  TextFormField(
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => widget.onpressed1!())));
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
                      style: const TextStyle(
                          color: Colors.blueAccent, fontSize: 22),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      widget.onpressed2!())));
                        })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}