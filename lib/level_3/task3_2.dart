import 'package:flutter/material.dart';

class Task3_2 extends StatefulWidget {
  const Task3_2({super.key});

  @override
  State<Task3_2> createState() => _Task3_2State();
}

class _Task3_2State extends State<Task3_2> {
  TextEditingController controller = TextEditingController();
  List<int> numbers = [];
  late String result = '';
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 3_2'),
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
              //hieu lon nhat = so lon nhat - so nho nhat trong mang
              int min = numbers.first;
              int max = numbers.last;
              setState(() {
                result = (max - min).toString();
              });
            },
            decoration: const InputDecoration(
                hintText: 'nhập các số cách nhau bởi dấu ,'),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text('hiệu lớn nhất của 2 phần tử trong mảng: $result'),
          )
        ],
      ),
    );
  }
}
