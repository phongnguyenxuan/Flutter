import 'package:flutter/material.dart';

class Task3_3 extends StatefulWidget {
  const Task3_3({super.key});

  @override
  State<Task3_3> createState() => _Task3_3State();
}

class _Task3_3State extends State<Task3_3> {
  TextEditingController controller = TextEditingController();
  List<int> numbers = [];
  late String result = '';
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 3_3'),
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
              setState(() {
                result = lis(numbers, numbers.length).toString();
              });
            },
            decoration: const InputDecoration(
                hintText: 'nhập các số cách nhau bởi dấu ,'),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text('độ dài của chuỗi con tịnh tiến dài nhất: $result'),
          )
        ],
      ),
    );
  }

  int lis(List<int> arr, int n) {
    List<int> _arr = List.generate(n, (index) => 1);
    int i, j, max = 0;

    // // khởi tạo giá trị cho các phần tử của list chứa  LIS values for all indexes
    // for (i = 0; i < n; i++) {
    //   _arr[i] = 1;
    // }

    // Compute optimized LIS values in
    // bottom up manner
    for (i = 1; i < n; i++) {
      for (j = 0; j < i; j++) {
        if (arr[i] > arr[j] && _arr[i] < _arr[j] + 1) {
          _arr[i] = _arr[j] + 1;
        }
      }
    }

    // Pick maximum of all LIS values
    for (i = 0; i < n; i++) {
      if (max < _arr[i]) max = _arr[i];
    }

    return max;
  }
}
