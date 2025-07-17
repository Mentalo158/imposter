import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({
    super.key,
    required this.playerList,
  });

  final List<String> playerList;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late Map<String, String> roles;
  final double offsetMaxY = -75.0;
  double offsetY = 0;

  @override
  void initState() {
    super.initState();
    chooseImposters();
  }

  void chooseImposters() {
    final players = List<String>.from(widget.playerList);
    int imposterCount = players.length >= 6 ? 2 : 1;

    players.shuffle();
    final imposters = players.take(imposterCount).toList();

    roles = {
      for (var p in widget.playerList)
        p: imposters.contains(p) ? 'imposter' : 'normal'
    };
  }

  //TODO add Pageview 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Positioned(
                      top: 550,
                      child: Text('Test'),
                    ),
                    Positioned(
                      top: offsetY,
                      left: 0,
                      right: 0,
                      child: GestureDetector(
                        onVerticalDragUpdate: (details) {
                          setState(() {
                            offsetY += details.delta.dy;
                            if (offsetY < offsetMaxY) {
                              offsetY = offsetMaxY;
                            } else if (offsetY > 0) {
                              offsetY = 0;
                            }
                          });
                        },
                        onVerticalDragEnd: (details) {
                          setState(() {
                            offsetY = 0;
                          });
                        },
                        child: Container(
                          height: 600,
                          width: double.infinity,
                          alignment: AlignmentDirectional.center,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Text(""),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
