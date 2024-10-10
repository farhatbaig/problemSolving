import 'package:flutter/material.dart';


class NumberWordConverter extends StatefulWidget {
  const NumberWordConverter({super.key});

  @override
  _NumberWordConverterState createState() => _NumberWordConverterState();
}

class _NumberWordConverterState extends State<NumberWordConverter> {
  final TextEditingController _controller = TextEditingController();
  String result = '';

  final Map<String, int> numberWords = {
    'zero': 0,
    'one': 1,
    'two': 2,
    'three': 3,
    'four': 4,
    'five': 5,
    'six': 6,
    'seven': 7,
    'eight': 8,
    'nine': 9,
    'ten': 10,
    'eleven': 11,
    'twelve': 12,
    'thirteen': 13,
    'fourteen': 14,
    'fifteen': 15,
    'sixteen': 16,
    'seventeen': 17,
    'eighteen': 18,
    'nineteen': 19,
    'twenty': 20,
    'thirty': 30,
    'forty': 40,
    'fifty': 50,
    'sixty': 60,
    'seventy': 70,
    'eighty': 80,
    'ninety': 90,
    'hundred': 100,
    'thousand': 1000,
    'million': 1000000,
  };

  int convertWordsToNumber(String input) {
    List<String> words = input.toLowerCase().split(' ');
    int result = 0;
    int current = 0;

    for (String word in words) {
      if (numberWords.containsKey(word)) {
        int value = numberWords[word]!;

        if (value == 100) {
          current *= value; 
        } else if (value >= 1000) {
          current *= value;
          result += current;
          current = 0; 
        } else {
          current += value;
        }
      }
    }

    result += current; 
    return result;
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
                labelText: 'Enter a number in words',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  String input = _controller.text;
                  result = convertWordsToNumber(input).toString();
                });
              },
              child: const Text('Convert'),
            ),
            const SizedBox(height: 20),
            Text(
              result.isNotEmpty
                  ? 'Your number is: $result'
                  : 'Please enter a valid number in words',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
    );
  }
}
