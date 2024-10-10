import 'package:flutter/material.dart';
class NumerologyCalculator extends StatefulWidget {
  const NumerologyCalculator({super.key});

  @override
  _NumerologyCalculatorState createState() => _NumerologyCalculatorState();
}

class _NumerologyCalculatorState extends State<NumerologyCalculator> {
  final TextEditingController _controller = TextEditingController();
  String destinyNumber = '';
  String heartDesireNumber = '';
  String personalityNumber = '';

  final Map<String, int> numerologyChart = {
    'A': 1, 'I': 1, 'J': 1, 'Q': 1, 'Y': 1,
    'B': 2, 'K': 2, 'R': 2,
    'C': 3, 'G': 3, 'L': 3, 'S': 3,
    'D': 4, 'M': 4, 'T': 4,
    'E': 5, 'H': 5, 'N': 5, 'X': 5,
    'U': 6, 'V': 6, 'W': 6,
    'O': 7, 'Z': 7,
    'F': 8, 'P': 8,
  };

  final Set<String> vowels = {'A', 'E', 'I', 'O', 'U'};

  void calculateNumerology(String name) {
    int destinySum = 0;
    int heartDesireSum = 0;
    int personalitySum = 0;

    List<String> nameLetters = name.toUpperCase().split('');

    for (String letter in nameLetters) {
      if (numerologyChart.containsKey(letter)) {
        int value = numerologyChart[letter]!;

        destinySum += value;

        if (vowels.contains(letter)) {
          heartDesireSum += value;
        } else {
          personalitySum += value;
        }
      }
    }

    setState(() {
      destinyNumber = destinySum.toString();
      heartDesireNumber = heartDesireSum.toString();
      personalityNumber = personalitySum.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your name',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String inputName = _controller.text.trim();
                if (inputName.isNotEmpty) {
                  calculateNumerology(inputName);
                }
              },
              child: const Text('Calculate Numerology Numbers'),
            ),
            const SizedBox(height: 20),
            if (destinyNumber.isNotEmpty)
              Column(
                children: [
                  Text(
                    'Destiny (Expression) Number: $destinyNumber',
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Heart Desire (Soul Urge) Number: $heartDesireNumber',
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Personality (Dream) Number: $personalityNumber',
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
          ],
        ),
    );
  }
}
