import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TestWidget extends StatelessWidget {
  final FirebaseAuth firebaseAuth;
  const TestWidget({super.key, required this.firebaseAuth});

  @override
  Widget build(BuildContext context) {
    dynamic snackBar;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: (() {
            firebaseAuth.currentUser!.delete();
            snackBar = const SnackBar(content: Text('Sign out successfully'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }),
          child: const Text(
            'Sign Out',
            style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
