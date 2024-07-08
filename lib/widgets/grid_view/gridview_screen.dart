import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GridViewScreen extends StatefulWidget {
  const GridViewScreen({super.key});

  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        mainAxisSpacing: 2.0,
        crossAxisSpacing: 2.0,
      ),
      itemCount: 45,
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
        ),
        child: TextButton(
            onPressed: () {},
            child: Text(
              '${Random().nextInt(45)}',
              style: const TextStyle(
                color: Colors.black,
              ),
            )),
      ),
    );
  }
}
