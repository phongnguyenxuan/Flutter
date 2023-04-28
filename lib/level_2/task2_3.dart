import 'package:flutter/material.dart';

class Task2_3 extends StatefulWidget {
  const Task2_3({super.key});

  @override
  State<Task2_3> createState() => _Task2_3State();
}

class _Task2_3State extends State<Task2_3> {
  TextEditingController input1Controller = TextEditingController();
  TextEditingController input2Controller = TextEditingController();
  List<String> words1 = [];
  List<String> words2 = [];
  late String result = '';
  //

  void longest_Common(String a, String b) {
//can bang do dai 2 chuoi
    if (a.length < b.length) {
      for (int i = 0; i <= b.length; i++) {
        a += ' ';
        if (a.length == b.length) {
          break;
        }
      }
    } else {
      for (int i = 0; i <= a.length; i++) {
        b += ' ';
        if (a.length == b.length) {
          break;
        }
      }
    }
    int n = a.length;
    int m = b.length;
    // Mang luu ket qua
    var arr = List.generate(
        n + 1, (i) => List.generate(m + 1, (j) => 0, growable: false),
        growable: false);
    //
    for (int j = 0; j <= m; j++) {
      arr[0][j] = 0;
    }
    for (int i = 0; i <= n; i++) {
      arr[i][0] = 0;
    }
    int _result = 0;
    int col = 0;
    int row = 0;
    for (int i = 1; i <= n; i++) {
      for (int j = 1; j <= m; j++) {
        if (a.characters.elementAt(j - 1) == b.characters.elementAt(i - 1)) {
          arr[i][j] = arr[i - 1][j - 1] + 1;
        } else {
          arr[i][j] = 0;
        }
        if (arr[i][j] > _result) {
          _result = arr[i][j];
          col = j;
          row = i;
        }
      }
    }
    var res = '';
    while (arr[row][col] > 0) {
      res = a[col - 1] + res;
      row -= 1;
      col -= 1;
    }
    setState(() {
      result = res.trim();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 2_3'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: input1Controller,
            decoration: const InputDecoration(hintText: 'input first string'),
          ),
          TextFormField(
            controller: input2Controller,
            decoration: const InputDecoration(hintText: 'input second string'),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                longest_Common(input1Controller.text, input2Controller.text);
              },
              child: Text('Check'),
            ),
          ),
          Text('result: $result')
        ],
      ),
    );
  }
}
