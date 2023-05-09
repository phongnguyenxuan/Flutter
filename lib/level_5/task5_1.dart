import 'package:flutter/material.dart';

class Task5_1 extends StatefulWidget {
  const Task5_1({super.key});

  @override
  State<Task5_1> createState() => _Task5_1State();
}

class _Task5_1State extends State<Task5_1> {
  var inputList = [];
  TextEditingController controller = TextEditingController();
  late String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 5_1'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: controller,
              onFieldSubmitted: (value) {
                inputList = controller.text.split(',');
                //
                int n = inputList.length;
                var reverseList = [];
                for (int i = n - 1; 0 <= i && i < n; i--) {
                  reverseList.add(inputList[i]);
                }
                setState(() {
                  result = reverseList.toString();
                });
              },
              decoration: const InputDecoration(
                  labelText: 'input list',
                  hintText: 'nhập các phần tử cách nhau bởi dấu ,'),
            ),
          ),
          Text(result)
        ],
      ),
    );
  }
}
