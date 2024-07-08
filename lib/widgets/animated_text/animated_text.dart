import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AnimatedText extends StatefulWidget {
  const AnimatedText({super.key});

  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  bool toggle = false;
  @override
  void initState() {
    toggle = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedDefaultTextStyle(
          style: TextStyle(
            color: toggle ? Colors.amber : Colors.indigo,
            fontWeight: toggle ? FontWeight.bold : FontWeight.normal,
            fontSize: toggle ? 16 : 12,
          ),
          duration: const Duration(milliseconds: 500),
          child: const Text('Text will be changed by below button click'),
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                toggle = !toggle;
              });
            },
            child: const Text('Click')),
      ],
    );
  }
}
