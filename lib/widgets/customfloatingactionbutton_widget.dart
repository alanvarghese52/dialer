import 'package:flutter/material.dart';
import 'dialpad_widget.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const DialPad()));
      },
      child: const Icon(Icons.dialpad),
    );
  }
}
