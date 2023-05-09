import 'package:flutter/material.dart';

class Task4_3 extends StatefulWidget {
  const Task4_3({super.key});

  @override
  State<Task4_3> createState() => _Task4_3State();
}

class _Task4_3State extends State<Task4_3> {
  TextEditingController controller = TextEditingController();
  List<String> words = [];
  late String result = '';

  int longest_Common(String a, String b) {
//can bang do dai 2 chuoi
    if (a.length < b.length) {
      for (int i = 0; i <= b.length; i++) {
        a += ' ';
        if (a.length == b.length) {
          break;
        }
      }
    } else if (a.length > b.length) {
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

    for (int i = 1; i <= n; i++) {
      for (int j = 1; j <= m; j++) {
        if (a.characters.elementAt(j - 1) == b.characters.elementAt(i - 1)) {
          arr[i][j] = arr[i - 1][j - 1] + 1;
        } else {
          arr[i][j] = 0;
        }
        if (arr[i][j] > _result) {
          _result = arr[i][j];
        }
      }
    }
    return _result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 4_3'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: controller,
              onFieldSubmitted: (value) {
                words = controller.text.split(',');
                //
                words.sort((a, b) => a.length.compareTo(b.length));
                //do dai list
                int n = words.length;
                int max = 0;
                //tu ngan nhat trong chuoi
                String shortWordLength = words.first;
                for (int i = 0; i < n; i++) {
                  int _longestSubstring =
                      longest_Common(shortWordLength, words[i]);
                  if (max < _longestSubstring) {
                    max = _longestSubstring;
                  }
                }
                setState(() {
                  result = max.toString();
                });
              },
              decoration: const InputDecoration(
                  labelText: 'list of strings',
                  hintText: 'nhập các chuỗi cách nhau bởi dấu ,'),
            ),
          ),
          Text(result)
        ],
      ),
    );
  }
}
