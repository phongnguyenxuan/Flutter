import 'package:flutter/material.dart';

class Task3_7 extends StatefulWidget {
  const Task3_7({super.key});

  @override
  State<Task3_7> createState() => _Task3_7State();
}

class _Task3_7State extends State<Task3_7> {
  TextEditingController controller = TextEditingController();
  late String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 3_7'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
              controller: controller,
              onFieldSubmitted: (value) {
                print(longestPalSubstr('amanaplanacanalpanama'));
                setState(() {
                  result = longestPalSubstr(controller.text).toString();
                });
              },
              decoration: const InputDecoration(
                labelText: 'input string',
              )),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('$result'),
          )
        ],
      ),
    );
  }

  int longestPalSubstr(String str) {
    int n = str.length;
    var table = List.generate(
        n, (i) => List.generate(n, (j) => false, growable: false),
        growable: false);

    int maxLength = 1;
    for (int i = 0; i < n; ++i) table[i][i] = true;

    int start = 0;
    for (int i = 0; i < n - 1; ++i) {
      if (str.characters.elementAt(i) == str.characters.elementAt(i + 1)) {
        table[i][i + 1] = true;
        start = i;
        maxLength = 2;
      }
    }

    for (int k = 3; k <= n; ++k) {
      for (int i = 0; i < n - k + 1; ++i) {
        int j = i + k - 1;
        if (table[i + 1][j - 1] &&
            str.characters.elementAt(i) == str.characters.elementAt(j)) {
          table[i][j] = true;

          if (k > maxLength) {
            start = i;
            maxLength = k;
          }
        }
      }
    }
    return maxLength;
  }
}
