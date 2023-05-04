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
    // get length of input string
    int n = str.length;

    // table[i][j] will be false if
    // substring str[i..j] is not palindrome.
    // Else table[i][j] will be true
    var table = List.generate(
        n, (i) => List.generate(n, (j) => false, growable: false),
        growable: false);

    // All substrings of length 1 are palindromes
    int maxLength = 1;
    for (int i = 0; i < n; ++i) table[i][i] = true;

    // check for sub-string of length 2.
    int start = 0;
    for (int i = 0; i < n - 1; ++i) {
      if (str.characters.elementAt(i) == str.characters.elementAt(i + 1)) {
        table[i][i + 1] = true;
        start = i;
        maxLength = 2;
      }
    }

    // Check for lengths greater than 2.
    // k is length of substring
    for (int k = 3; k <= n; ++k) {
      // Fix the starting index
      for (int i = 0; i < n - k + 1; ++i) {
        // Get the ending index of substring from
        // starting index i and length k
        int j = i + k - 1;

        // checking for sub-string from ith index to
        // jth index if str.charAt(i+1) to
        // str.charAt(j-1) is a palindrome
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
