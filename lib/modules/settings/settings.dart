import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Settings Screen",
      style: TextStyle(fontSize: 24, color: Colors.blueGrey),
    );
  }
}
