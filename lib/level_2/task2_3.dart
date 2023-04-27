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
    // luu do dai xau con chung dai nhat
    String subsequence = "";
    int n = a.length;
    int m = b.length;
    // Mang luu ket qua
    var L = List.generate(
        n + 1, (i) => List.generate(m + 1, (j) => 0, growable: false),
        growable: false);

    for (int i = 1; i <= n; i++) {
      for (int j = 1; j <= m; j++) {
        if (a[i - 1] == b[j - 1]) {
          // Nếu có phần tử bằng nhau
          L[i][j] = L[i - 1][j - 1] + 1; // Áp dụng công thức
        } else {
          // Trường hợp a[i-1] khác b[j-1]
          if (L[i - 1][j] >= L[i][j - 1]) {
            L[i][j] = L[i - 1][j];
          } else {
            L[i][j] = L[i][j - 1];
          }
        }
      }
    }
    int i = n;
    int j = m;
    while (L[i][j] != 0) {
      // Điều kiện dừng
      if (a[i - 1] == b[j - 1]) {
        // Nếu bằng nhau
        subsequence += a[i - 1]; // Cộng a[i-1] vào xâu con
        i--;
        j--;
      } else {
        // Nếu khác nhau
        if (L[i - 1][j] >= L[i][j - 1]) {
          i--;
        } else {
          j--;
        }
      }
    }
    setState(() {
      result = subsequence;
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
