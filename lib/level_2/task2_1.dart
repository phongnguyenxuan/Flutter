import 'package:flutter/material.dart';

class Task2_1 extends StatefulWidget {
  const Task2_1({super.key});

  @override
  State<Task2_1> createState() => _Task2_1State();
}

class _Task2_1State extends State<Task2_1> {
  TextEditingController controller = TextEditingController();
  List<int> numbers = [];
  late String result = '';
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 2_1'),
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
                //so lon thu 2 trong mang
                result = numbers
                    .lastWhere((element) => element < numbers.last)
                    .toString();
              });
            },
            decoration: const InputDecoration(
                hintText: 'nhập các số cách nhau bởi dấu ,'),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text('the second largest number in the list: $result'),
          )
        ],
      ),
    );
  }
}
