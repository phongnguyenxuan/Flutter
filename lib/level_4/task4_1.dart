import 'package:flutter/material.dart';

class Task4_1 extends StatefulWidget {
  const Task4_1({super.key});

  @override
  State<Task4_1> createState() => _Task4_1State();
}

class _Task4_1State extends State<Task4_1> {
  TextEditingController controller = TextEditingController();
  List<int> numbers = [];
  late String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 4_1'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: controller,
            keyboardType: TextInputType.number,
            onFieldSubmitted: (value) {
              numbers =
                  controller.text.split(',').map((e) => int.parse(e)).toList();
              int count = 0;
              int n = numbers.length;
              //bubble sort
              for (int i = 0; i < n - 1; i++) {
                for (int j = 0; j < n - i - 1; j++) {
                  if (numbers[j] > numbers[j + 1]) {
                    int temp = numbers[j];
                    numbers[j] = numbers[j + 1];
                    numbers[j + 1] = temp;
                    count++;
                  }
                }
              }
              setState(() {
                result = count.toString();
              });
            },
            decoration: const InputDecoration(
                hintText: 'nhập các số cách nhau bởi dấu ,'),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
                'cần ${result.isEmpty ? 'số' : result} lần sắp xếp để hoàn thành'),
          )
        ],
      ),
    );
  }
}
