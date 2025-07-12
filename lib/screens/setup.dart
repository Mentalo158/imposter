import 'package:flutter/material.dart';

class SetupScreen extends StatefulWidget {
  const SetupScreen({super.key});

  @override
  State<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  late TextEditingController controller;
  final List<String> playerList = [];

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void addPlayer(String playerName) {
    setState(() {
      playerList.add(playerName);
    });
  }

  void removePlayer(int index) {
    setState(() {
      playerList.removeAt(index);
    });
  }

  Future<String?> openDialog() => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Add Player'),
          content: TextField(
            autofocus: true,
            decoration: const InputDecoration(hintText: 'Player Name'),
            controller: controller,
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                final text = controller.text;
                if (text.isNotEmpty) {
                  Navigator.of(context).pop(text);
                  controller.clear();
                }
              },
              child: const Text('Add'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Players')),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: playerList.asMap().entries.map(
                  (entry) {
                    final index = entry.key;
                    final player = entry.value;
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      child: ListTile(
                        title: Text(player),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => removePlayer(index),
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextButton.icon(
                onPressed: () async {
                  final playerName = await openDialog();
                  if (playerName != null && playerName.isNotEmpty) {
                    addPlayer(playerName);
                  }
                },
                icon: const Icon(Icons.add),
                label: const Text('Enter Name'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
