import 'package:estimateapp/goldPage.dart';
import 'package:estimateapp/silverPage.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const GoldPage()),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 75),
                backgroundColor: Colors.amber,
                textStyle: const TextStyle(fontSize: 26),
              ),
              child: const Text('Gold'),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const SilverPage()),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 75),
                backgroundColor: Colors.blueGrey,
                textStyle: const TextStyle(fontSize: 26),
              ),
              child: const Text('Silver'),
            )
          ],
        ),
      ),
    );
  }
}
