import 'dart:math';

import 'package:flutter/material.dart';

class Task3_4 extends StatefulWidget {
  const Task3_4({super.key});

  @override
  State<Task3_4> createState() => _Task3_4State();
}

class _Task3_4State extends State<Task3_4> {
  TextEditingController controller = TextEditingController();
  List<String> words = [];
  late String text = '';
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 3_4'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: controller,
            keyboardType: TextInputType.number,
            onFieldSubmitted: (value) {
              words = controller.text.split(',');
              List<String> maxOverlap = findLargestOverlap(words);
              print(maxOverlap);
              setState(() {
                text =
                    "The two strings with the largest overlap of characters are $maxOverlap";
              });
            },
            decoration: const InputDecoration(
                hintText: 'nhập các chuoi cách nhau bởi dấu ,'),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(text),
          )
        ],
      ),
    );
  }

  List<String> findLargestOverlap(List<String> strings) {
    List<String> result = [];
    int maxOverlap = 0;
    for (int i = 0; i < strings.length; i++) {
      for (int j = i + 1; j < strings.length; j++) {
        String s1 = strings.elementAt(i);
        String s2 = strings.elementAt(j);
        int overlap = findOverlap(s1, s2);
        if (overlap > maxOverlap) {
          result.clear();
          maxOverlap = overlap;
          result.add(s1);
          result.add(s2);
        }
      }
    }
    return result;
  }

  int findOverlap(String s1, String s2) {
    int n1 = s1.length;
    int n2 = s2.length;
    int maxOverlap = 0;
    for (int i = 0; i < n1; i++) {
      for (int j = 0; j < n2; j++) {
        if (s1.characters.elementAt(i) == s2.characters.elementAt(j)) {
          maxOverlap++;
        }
      }
    }
    return maxOverlap;
  }
}
