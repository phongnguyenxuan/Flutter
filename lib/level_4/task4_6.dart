import 'package:flutter/material.dart';

class Task4_6 extends StatefulWidget {
  const Task4_6({super.key});

  @override
  State<Task4_6> createState() => _Task4_6State();
}

class _Task4_6State extends State<Task4_6> {
  TextEditingController controller = TextEditingController();
  List<int> numbers = [];
  late String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 4_6'),
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

              int n = numbers.length;
              int max = 0;
              //bubble sort
              for (int i = 0; i < n; i++) {
                for (int j = i + 1; j < n; j++) {
                  for (int k = j + 1; k < n; k++) {
                    int a = numbers[i] * numbers[j] * numbers[k];
                    if (max < a) {
                      max = a;
                    }
                  }
                }
              }
              setState(() {
                result = max.toString();
              });
            },
            decoration: const InputDecoration(
                hintText: 'nhập các số cách nhau bởi dấu ,'),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(result),
          )
        ],
      ),
    );
  }
}
