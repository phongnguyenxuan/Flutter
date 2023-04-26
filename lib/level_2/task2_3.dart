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
                words1 = input1Controller.text.split('');
                words2 = input2Controller.text.split('');
                String subsequence = "";
              },
              child: Text('Check'),
            ),
          ),
          Text('result: ')
        ],
      ),
    );
  }
}
