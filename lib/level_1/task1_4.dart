import 'package:flutter/material.dart';

class Task1_4 extends StatefulWidget {
  const Task1_4({super.key});

  @override
  State<Task1_4> createState() => _Task1_4State();
}

class _Task1_4State extends State<Task1_4> {
  TextEditingController length = TextEditingController();
  final List<TextEditingController> _controller = [];
  //nhap mang
  inputList(int length) {
    for (int i = 0; i < length; i++) {
      _controller.add(TextEditingController());
    }
  }

  late int max = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Task 1_4'),
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: length,
                decoration:
                    const InputDecoration(hintText: 'Input list length'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        inputList(int.parse(length.text));
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
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
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
                        onPressed: () {
                          //tim max trong mang
                          max = int.parse(_controller[0].text);
                          for (int i = 0; i < _controller.length; i++) {
                            int number = int.parse(_controller[i].text);
                            if (max < number) {
                              setState(() {
                                max = number;
                              });
                            }
                          }
                        },
                        child: Text('largest number in the list: $max')),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
