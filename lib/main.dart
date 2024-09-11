//You are required to implement a simple chessboard layout in Flutter.
// The chessboard should be an 8x8 matrix where each cell alternates between black and white,
// starting with the top-left corner being white.
// You can ignore adding actual chess pieces for this task and focus purely on
// the board structure and its correct visual appearance.
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> chessList = List<int>.generate(64, (i) => i);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Chess Bord"),
        ),
        body: SafeArea(
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 8,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            children: chessList.map((cell) {
              int row = cell ~/ 8;
              int col = cell % 8;

              Color color = (row + col) % 2 == 0 ? Colors.white : Colors.black;

              return Container(
                color: color,
                height: 10,
                width: 10,
              );
            }).toList(),
          ),
        ));
  }
}
