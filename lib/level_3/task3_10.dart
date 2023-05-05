import 'package:flutter/material.dart';

class Task3_10 extends StatefulWidget {
  const Task3_10({super.key});

  @override
  State<Task3_10> createState() => _Task3_10State();
}

class _Task3_10State extends State<Task3_10> {
  TextEditingController controller = TextEditingController();
  List<String> words = [];
  late String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 3_10'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: controller,
            onFieldSubmitted: (value) {
              words = controller.text.split(',');
              //sap xep cac chuoi trong mang theo thu tu tang dan
              words.sort((a, b) => a.length.compareTo(b.length));
              setState(() {
                text = words.toString();
              });
            },
            decoration: const InputDecoration(
                hintText: 'nhập các chuoi cách nhau bởi dấu ,'),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(text),
          )
        ],
      ),
    );
  }
}
