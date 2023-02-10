import 'package:flutter/material.dart';

class MySnackbar {
  showDialog(BuildContext context) {
    Scaffold.of(context).showBottomSheet(
        (context) => const SnackBar(content: Text('Submitting form')));
  }
}
