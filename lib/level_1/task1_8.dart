import 'package:flutter/material.dart';

class Task1_8 extends StatefulWidget {
  const Task1_8({super.key});

  @override
  State<Task1_8> createState() => _Task1_8State();
}

class _Task1_8State extends State<Task1_8> {
  TextEditingController listLength = TextEditingController();
  final List<TextEditingController> _controller = [];
  List<int> numbers = [];
  inputList(int length) {
    for (int i = 0; i < length; i++) {
      _controller.add(TextEditingController());
    }
  }

  late String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 1_8'),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: listLength,
              decoration: const InputDecoration(hintText: 'Input list length'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      inputList(int.parse(listLength.text));
                    });
                  },
                  child: const Text('Next')),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: _controller.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(20),
                    height: 70,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Column(
                      children: [
                        Text('number ${index + 1}'),
                        TextFormField(
                            controller: _controller[index],
                            textAlign: TextAlign.center),
                      ],
                    ),
                  );
                },
              ),
            ),
            Flexible(
              child: Column(
                children: [
                  ElevatedButton(
                      style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.all(50)),
                      ),
                      onPressed: () {
                        numbers.clear();
                        for (int i = 0; i < _controller.length; i++) {
                          numbers.add(int.parse(_controller[i].text));
                        }
                        //sap xep tang dan
                        numbers.sort();
                        //so trung vi

                        for (int i = 0; i <= numbers.length; i++) {
                          if (numbers.length % 2 == 0) {
                            int a = numbers
                                .elementAt((numbers.length / 2 - 1) as int);
                            int b =
                                numbers.elementAt((numbers.length / 2) as int);
                            setState(() {
                              result = ((a + b) / 2).toString();
                            });
                            print(result);
                          } else {
                            int c = numbers
                                .elementAt((numbers.length - 1) / 2 as int);
                            setState(() {
                              result = c.toString();
                            });
                          }
                        }
                      },
                      child: Text('Số trung vị: $result')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
