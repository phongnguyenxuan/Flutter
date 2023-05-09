import 'package:flutter/material.dart';

class Task4_7 extends StatefulWidget {
  const Task4_7({super.key});

  @override
  State<Task4_7> createState() => _Task4_7State();
}

class _Task4_7State extends State<Task4_7> {
  TextEditingController controller = TextEditingController();
  List<String> words = [];
  late String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 4_7'),
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
                int n = words.length;
                for (int i = 0; i < n; i++) {
                  for (int j = i + 1; j < n; j++) {
                    if (words[i].length < words[j].length) {
                      String temp = words[j];
                      words[j] = words[i];
                      words[i] = temp;
                    }
                    //neu co cung do dai
                    else if (words[i].length == words[j].length) {
                      if (words[j].compareTo(words[i]) > 0) {
                        String temp = words[j];
                        words[j] = words[i];
                        words[i] = temp;
                      }
                    }
                  }
                }
                setState(() {
                  result = words.toString();
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
