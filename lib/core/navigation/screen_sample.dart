import 'package:flutter/material.dart';

class ScrrenSample extends StatelessWidget {
  const ScrrenSample({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(child: Text('Enjoy this screen. 💖💖'))
      ),
    );
  }
}