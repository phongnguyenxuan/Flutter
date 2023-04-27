import 'package:flutter/material.dart';

class Task1_2 extends StatefulWidget {
  const Task1_2({super.key});

  @override
  State<Task1_2> createState() => _Task1_2State();
}

class _Task1_2State extends State<Task1_2> {
  TextEditingController controller = TextEditingController();
  var length;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 1_2'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Input String:'),
          TextFormField(
            controller: controller,
            onChanged: (value) {
              setState(() {
                //do dai 1 chuoi
                length = controller.text.length;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('length of the string: $length'),
          ),
        ],
      ),
    );
  }
}
