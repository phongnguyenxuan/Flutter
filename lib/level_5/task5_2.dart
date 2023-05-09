import 'package:flutter/material.dart';

class Task5_2 extends StatefulWidget {
  const Task5_2({super.key});

  @override
  State<Task5_2> createState() => _Task5_2State();
}

class _Task5_2State extends State<Task5_2> {
  var inputList = [];
  TextEditingController controller = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  late String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 5_2'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: controller,
              onFieldSubmitted: (value) {},
              decoration: const InputDecoration(
                  labelText: 'input list',
                  hintText: 'nhập các phần tử cách nhau bởi dấu ,'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: sizeController,
              decoration: const InputDecoration(
                labelText: 'chunk size',
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                inputList = controller.text.split(',');
                //
                int chunkSize = int.parse(sizeController.text);
                int n = inputList.length;
                var chunks = [];
                for (var i = 0; i < n; i += chunkSize) {
                  chunks.add(inputList.sublist(
                      i,
                      i + chunkSize > inputList.length
                          ? inputList.length
                          : i + chunkSize));
                }
                setState(() {
                  result = chunks.toString();
                });
              },
              child: null),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(result),
          )
        ],
      ),
    );
  }
}
