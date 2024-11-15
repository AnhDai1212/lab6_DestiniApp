import 'package:flutter/material.dart';

void main() {
  runApp(DestiniApp());
}

class DestiniApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  int storyIndex = 0;

  List<String> stories = [
    'You find yourself in a dark room. There is a door to your left and right. Which one do you take?',
    'You enter the left door and find a dragon! Do you fight or run away?',
    'You run away and find a treasure chest. Do you open it or leave it?',
    'You fight the dragon and win! You find a treasure. Do you take it or leave it?',
    'You leave the treasure and walk away. You live a simple life.',
    'You open the treasure chest and find gold! You are now rich!',
    'You run away and live to fight another day.'
  ];

  List<String> choice1 = [
    'Left',
    'Fight',
    'Open it',
    'Take it',
    'End',
    'End',
    'End'
  ];

  List<String> choice2 = [
    'Right',
    'Run away',
    'Leave it',
    'Leave it',
    'End',
    'End',
    'End'
  ];

  void nextStory(int choice) {
    if (storyIndex == 0) {
      storyIndex = choice == 1 ? 1 : 2;
    } else if (storyIndex == 1) {
      storyIndex = choice == 1 ? 3 : 6;
    } else if (storyIndex == 2) {
      storyIndex = choice == 1 ? 5 : 4;
    } else {
      storyIndex = 0; // Reset to the beginning
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Destini'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              stories[storyIndex],
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => nextStory(1),
              child: Text(choice1[storyIndex]),
            ),
            ElevatedButton(
              onPressed: () => nextStory(2),
              child: Text(choice2[storyIndex]),
            ),
          ],
        ),
      ),
    );
  }
}