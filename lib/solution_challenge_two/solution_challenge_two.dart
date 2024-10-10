import 'package:flutter/material.dart';

class TowerGame extends StatefulWidget {
  const TowerGame({super.key});

  @override
  _TowerGameState createState() => _TowerGameState();
}

class _TowerGameState extends State<TowerGame> {
  List<List<int>> towers = [
    [3, 2, 1], 
    [], 
    [], 
  ];

  int moves = 0; 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Moves: $moves',
            style: const TextStyle(
              fontSize: 28,
              color: Colors.tealAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildTower(0),
              buildTower(1),
              buildTower(2),
            ],
          ),
        ),
        if (towers[2].length == 3)
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'You Win!',
              style: TextStyle(
                fontSize: 36,
                color: Colors.greenAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }

  Widget buildTower(int towerIndex) {
    return DragTarget<int>(
      onWillAcceptWithDetails: (details) {
        return towers[towerIndex].isEmpty || towers[towerIndex].last > details.data!;
      },
      onAcceptWithDetails: (details) {
        setState(() {
          for (var tower in towers) {
            if (tower.contains(details.data)) {
              tower.remove(details.data);
              break;
            }
          }
          towers[towerIndex].add(details.data);
          moves++; 
        });
      },
      builder: (context, accepted, rejected) => Container(
        width: 100,
        height: 300,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.tealAccent, width: 2.0),
          borderRadius: BorderRadius.circular(10),
          color: Colors.teal.withOpacity(0.2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: towers[towerIndex]
              .reversed 
              .map((diskSize) => Draggable<int>(
                    data: diskSize,
                    feedback: buildDisk(diskSize, isDragging: true),
                    childWhenDragging: Container(),
                    child: buildDisk(diskSize),
                  ))
              .toList(),
        ),
      ),
    );
  }

  Widget buildDisk(int size, {bool isDragging = false}) {
    final colors = [Colors.greenAccent, Colors.amber, Colors.redAccent];
    return Container(
      width: 50.0 + size * 15.0,
      height: 30,
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        color: isDragging ? Colors.white.withOpacity(0.8) : colors[size - 1],
        borderRadius: BorderRadius.circular(15), 
        boxShadow: isDragging
            ? []
            : [
                const BoxShadow(
                  color: Colors.black45,
                  offset: Offset(0, 5),
                  blurRadius: 5,
                )
              ],
      ),
      alignment: Alignment.center,
      child: Text(
        size.toString(),
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
