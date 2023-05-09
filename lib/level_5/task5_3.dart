import 'package:flutter/material.dart';

class Task5_3 extends StatefulWidget {
  const Task5_3({super.key});

  @override
  State<Task5_3> createState() => _Task5_3State();
}

class _Task5_3State extends State<Task5_3> {
  List<int> inputList = [];
  TextEditingController controller = TextEditingController();
  late String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 5_3'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: controller,
              onFieldSubmitted: (value) {
                inputList = controller.text
                    .split(',')
                    .map((e) => int.parse(e))
                    .toList();
                //
                int n = inputList.length;
                var newList = [];
                for (int i = 0; i < n; i++) {
                  newList.add(inputList[i]);
                  for (int j = i + 1; j < n; j++) {
                    if (inputList[i] == inputList[j]) {
                      newList.removeWhere((element) => element == inputList[j]);
                    }
                  }
                }
                setState(() {
                  result = newList.toString();
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
