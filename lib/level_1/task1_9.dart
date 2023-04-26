import 'package:flutter/material.dart';

class Task1_9 extends StatefulWidget {
  const Task1_9({super.key});

  @override
  State<Task1_9> createState() => _Task1_9State();
}

class _Task1_9State extends State<Task1_9> {
  TextEditingController controller = TextEditingController();
  String result = '';
  List<String> words = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task1_9'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: controller,
            onFieldSubmitted: (value) {
              words.clear();
              words = controller.text.split(' ');
              setState(() {
                result = words.length.toString();
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('số từ trong chuỗi: $result'),
          )
        ],
      ),
    );
  }
}
