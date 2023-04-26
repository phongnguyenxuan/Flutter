import 'package:flutter/material.dart';

class Task1_10 extends StatefulWidget {
  const Task1_10({super.key});

  @override
  State<Task1_10> createState() => _Task1_10State();
}

class _Task1_10State extends State<Task1_10> {
  TextEditingController controller = TextEditingController();
  String result = '';
  List<String> words = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task1_10'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: controller,
            onFieldSubmitted: (value) {
              words.clear();
              var listString = controller.text.split('');
              for (int i = 0; i < listString.length; i++) {
                if (listString[i].contains('a')) {
                  words.add(listString[i]);
                }
              }
              setState(() {
                result = words.length.toString();
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child:
                Text("number of strings that contain the letter 'a' :$result"),
          )
        ],
      ),
    );
  }
}
