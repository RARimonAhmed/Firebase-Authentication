// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });

  dynamic snackBar;

  @override
  Widget build(BuildContext context) {
    signOut(FirebaseAuth? firebaseAuthUser) async {
      await firebaseAuthUser!.currentUser!.delete();
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(firebaseAuthUser!.currentUser!.email.toString()),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: (() {
                signOut();
                snackBar =
                    const SnackBar(content: Text('Sign out successfully'));
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
        ),
      ),
    );
  }
}
