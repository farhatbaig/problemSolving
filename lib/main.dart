import 'package:flutter/material.dart';
import 'package:my_project_name/solution_challenge_one/solution_challenge_one.dart';
import 'package:my_project_name/solution_challenge_three/solution_challenge_three.dart';
import 'package:my_project_name/solution_challenge_two/solution_challenge_two.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Solutions'),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Solution 1'),
                Tab(text: 'Solution 2'),
                Tab(text: 'Solution 3'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              NumberWordConverter(),
              TowerGame(),
              NumerologyCalculator(),
            ],
          ),
        ),
      ),
    );
  }
}

void main() => runApp(const MyApp());

