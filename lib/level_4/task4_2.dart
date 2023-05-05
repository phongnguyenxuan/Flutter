import 'dart:math';

import 'package:flutter/material.dart';

class Task4_2 extends StatefulWidget {
  const Task4_2({super.key});

  @override
  State<Task4_2> createState() => _Task4_2State();
}

class _Task4_2State extends State<Task4_2> {
  TextEditingController numbersController = TextEditingController();
  TextEditingController targetValController = TextEditingController();
  List<int> numbers = [];
  int targetVal = 0;
  late String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 4_2'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(result),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: numbersController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'List number',
                  hintText: 'nhập các số cách nhau bởi dấu ,'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: targetValController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Target value', hintText: 'Target value'),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                //list number
                numbers = numbersController.text
                    .split(',')
                    .map((e) => int.parse(e))
                    .toList();
                //target value
                targetVal = int.parse(targetValController.text);
                //list length
                int n = numbers.length;
                setState(() {
                  result =
                      "result: ${subsetSum(numbers, n, targetVal).toString()}";
                });
              },
              child: null)
        ],
      ),
    );
  }

  int subsetSum(List<int> arr, int n, int targetVal) {
    //init matrix
    var _arr = List.generate(
        n + 1, (i) => List.generate(targetVal + 1, (j) => 0, growable: false),
        growable: false);
    _arr[0][0] = 1;
    for (int i = 1; i <= n; i++) {
      for (int j = 0; j <= targetVal; j++) {
        if (arr[i - 1] > j) {
          _arr[i][j] = _arr[i - 1][j];
        } else {
          _arr[i][j] = _arr[i - 1][j] + _arr[i - 1][j - arr[i - 1]];
        }
      }
    }
    return _arr[n][targetVal];
  }
}
