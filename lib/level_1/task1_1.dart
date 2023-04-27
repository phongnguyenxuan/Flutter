import 'package:flutter/material.dart';

// ignore: camel_case_types
class Task1_1 extends StatefulWidget {
  const Task1_1({super.key});

  @override
  State<Task1_1> createState() => _Task1_1State();
}

class _Task1_1State extends State<Task1_1> {
  TextEditingController number1Input = TextEditingController();
  TextEditingController number2Input = TextEditingController();
  int result = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 1_1'),
      ),
      body: Container(
        margin: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('number 1:'),
            TextFormField(
              controller: number1Input,
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('number 2:'),
            ),
            TextFormField(
              controller: number2Input,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      //tinh tong hai so
                      result = int.parse(number1Input.text) +
                          int.parse(number2Input.text);
                    });
                  },
                  child: const Text('Sum')),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('Result: $result'),
            )
          ],
        ),
      ),
    );
  }
}
