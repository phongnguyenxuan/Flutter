import 'package:flutter/material.dart';

class Task2_5 extends StatefulWidget {
  const Task2_5({super.key});

  @override
  State<Task2_5> createState() => _Task2_5State();
}

class _Task2_5State extends State<Task2_5> {
  TextEditingController controller = TextEditingController();
  List<int> numbers = [];
  late String result = '';
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 2_5'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: controller,
            onFieldSubmitted: (value) {
              //mang luu tru cac so vua nhap
              numbers =
                  controller.text.split(',').map((e) => int.parse(e)).toList();
              int listSize = numbers.length;
              int maxSum = 0;
              for (int i = 0; i <= listSize - 1; i++) {
                int currSum = 0;
                for (int j = i; j <= listSize - 1; j++) {
                  //tong chuoi con trong mang
                  currSum += numbers[j];
                  if (currSum > maxSum) {
                    maxSum = currSum;
                  }
                }
              }
              setState(() {
                result = maxSum.toString();
              });
            },
            decoration: const InputDecoration(
                hintText: 'nhập các số cách nhau bởi dấu ,'),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
                'the maximum sum of any contiguous subarray within the list: $result'),
          )
        ],
      ),
    );
  }
}
