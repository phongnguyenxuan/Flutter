import 'package:flutter/material.dart';

class Task3_1 extends StatefulWidget {
  const Task3_1({super.key});

  @override
  State<Task3_1> createState() => _Task3_1State();
}

class _Task3_1State extends State<Task3_1> {
  TextEditingController controller = TextEditingController();
  List<int> numbers = [];
  late String result = '';
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 3_1'),
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
              //sap xep mang giam dan
              numbers.sort((a, b) => b.compareTo(a));
              setState(() {
                //so nho thu 2 trong mang
                result = numbers
                    .lastWhere((element) => element > numbers.last)
                    .toString();
              });
            },
            decoration: const InputDecoration(
                hintText: 'nhập các số cách nhau bởi dấu ,'),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text('the second smallest number in the list: $result'),
          )
        ],
      ),
    );
  }
}
