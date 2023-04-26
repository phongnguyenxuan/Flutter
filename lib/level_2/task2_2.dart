import 'package:flutter/material.dart';

class Task2_2 extends StatefulWidget {
  const Task2_2({super.key});

  @override
  State<Task2_2> createState() => _Task2_2State();
}

class _Task2_2State extends State<Task2_2> {
  TextEditingController controller = TextEditingController();
  List<String> words = [];
  late String result = '';
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 2_2'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: controller,
            onFieldSubmitted: (value) {
              words = controller.text.split(',');
              int longestString = words[0].length;
              for (int i = 0; i < words.length; i++) {
                if (longestString < words[i].length) {
                  setState(() {
                    result = words[i];
                  });
                }
              }
            },
            decoration: const InputDecoration(
                hintText: 'nhập các số cách nhau bởi dấu ,'),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text('the longest word in the list: $result'),
          )
        ],
      ),
    );
  }
}
