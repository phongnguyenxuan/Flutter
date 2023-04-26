import 'package:flutter/material.dart';

class Task1_6 extends StatefulWidget {
  const Task1_6({super.key});

  @override
  State<Task1_6> createState() => _Task1_6State();
}

class _Task1_6State extends State<Task1_6> {
  TextEditingController controller = TextEditingController();
  List<int> numbers = [];
  late String result = '';
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 1_6'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: controller,
            onFieldSubmitted: (value) {
              var listSplit = controller.text.split(',');
              for (int i = 0; i < listSplit.length; i++) {
                numbers.add(int.parse(listSplit[i]));
              }
              //sap xep mang tang dan
              numbers.sort();
              setState(() {
                result = numbers.toString();
              });
            },
            decoration: const InputDecoration(
                hintText: 'nhập các số cách nhau bởi dấu ,'),
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
