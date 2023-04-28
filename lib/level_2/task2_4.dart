import 'package:flutter/material.dart';

class Task2_4 extends StatefulWidget {
  const Task2_4({super.key});

  @override
  State<Task2_4> createState() => _Task2_4State();
}

class _Task2_4State extends State<Task2_4> {
  TextEditingController controller = TextEditingController();
  List<int> numbers = [];
  late String result = '';
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 2_4'),
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
              //mang luu cac so chia het cho 3 va 5
              List<int> listRes = [];
              for (int i = 0; i < numbers.length; i++) {
                if (numbers[i] % 3 == 0 && numbers[i] % 5 == 0) {
                  listRes.add(numbers[i]);
                }
              }
              if (listRes.isEmpty) {
                setState(() {
                  result =
                      'Trong list không có số nào thỏa mãn điều kiện chia hết 3 và 5';
                });
              } else {
                var sum = 0;
                for (int i = 0; i < listRes.length; i++) {
                  sum += listRes[i];
                }
                setState(() {
                  result = 'Tổng các số trong list chia hết cho 3 và 5 : $sum';
                });
              }
            },
            decoration: const InputDecoration(
                hintText: 'nhập các số cách nhau bởi dấu ,'),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text('the longest word in the list: $result'),
          )
        ],
      ),
    );
  }
}
