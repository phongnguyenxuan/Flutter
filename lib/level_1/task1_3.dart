import 'package:flutter/material.dart';

class Task1_3 extends StatefulWidget {
  const Task1_3({super.key});

  @override
  State<Task1_3> createState() => _Task1_3State();
}

class _Task1_3State extends State<Task1_3> {
  TextEditingController controller = TextEditingController();
  late int result = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 1_3'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: controller,
          ),
          ElevatedButton(
              onPressed: () {
                try {
                  setState(() {
                    //binh phuong
                    result =
                        int.parse(controller.text) * int.parse(controller.text);
                  });
                } catch (e) {
                  print(e);
                }
              },
              child: const Text('click')),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text('result: $result'),
          )
        ],
      ),
    );
  }
}
