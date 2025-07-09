import 'package:flutter/material.dart';
import 'package:imposter/screens/game.dart';
import 'package:imposter/screens/setup.dart';

class MainMenueScreen extends StatelessWidget {
  const MainMenueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Image(image: AssetImage(''),),
            FloatingActionButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const GameScreen()),
              ),
              child: const Text('Start Game'),
            ),
            FloatingActionButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SetupScreen()),
              ),
              child: const Text('Customize Own Words'),
            ),
          ],
        ),
      ),
    );
  }
}
