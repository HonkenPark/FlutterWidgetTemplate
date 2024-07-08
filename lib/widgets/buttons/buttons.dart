import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('AppBar Widget'),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                foregroundColor: Colors.amber,
                backgroundColor: Colors.grey.shade900,
                overlayColor: Colors.blue,
                elevation: 100,
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                iconColor: Colors.red,
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.shortestSide / 2,
                height: MediaQuery.of(context).size.shortestSide / 10,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.navigation_outlined,
                    ),
                    Text('NavigationRail Screen'),
                  ],
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              label: const Icon(Icons.login),
              style: ElevatedButton.styleFrom(
                overlayColor: Colors.red,
                iconColor: Colors.red,
              ),
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Splash Screen'),
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                foregroundColor: Colors.indigo,
                backgroundColor: Colors.grey,
                overlayColor: Colors.blue,
                elevation: 100,
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                iconColor: Colors.red,
              ),
              child: const Text('Outline Button 2'),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              label: const Icon(Icons.settings),
              style: ElevatedButton.styleFrom(
                overlayColor: Colors.indigo,
                iconColor: Colors.indigo,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Text Button'),
            ),
            TextButton.icon(
              onPressed: () {},
              label: const Icon(Icons.text_fields_outlined),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.text_fields),
                ),
                IconButton.filled(
                  onPressed: () {},
                  icon: const Icon(Icons.text_fields),
                ),
                IconButton.filledTonal(
                  onPressed: () {},
                  icon: const Icon(Icons.text_fields),
                ),
                IconButton.outlined(
                  onPressed: () {},
                  icon: const Icon(Icons.text_fields),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Text('Icon Button'),
                ),
              ],
            ),
            FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.green,
              hoverElevation: 100,
              child: const Icon(
                Icons.call,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
