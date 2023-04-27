import 'package:flutter/material.dart';

class Task1_7 extends StatefulWidget {
  const Task1_7({super.key});

  @override
  State<Task1_7> createState() => _Task1_7State();
}

class _Task1_7State extends State<Task1_7> {
  TextEditingController controller = TextEditingController();
  List<String> listString = [];
  late String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 1_7'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: controller,
            onFieldSubmitted: (value) {
              listString = controller.text.split(',');
              //sorts the list in alphabetical order
              listString.sort();
              setState(() {
                result = listString.toString();
              });
            },
            decoration: const InputDecoration(
                hintText: 'nhập các chữ cách nhau bởi dấu , '),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(result),
          )
        ],
      ),
    );
  }
}
