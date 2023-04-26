import 'package:flutter/material.dart';

class Task1_5 extends StatefulWidget {
  const Task1_5({super.key});

  @override
  State<Task1_5> createState() => _Task1_5State();
}

class _Task1_5State extends State<Task1_5> {
  TextEditingController length = TextEditingController();
  final List<TextEditingController> _controller = [];
  inputList(int length) {
    for (int i = 0; i < length; i++) {
      _controller.add(TextEditingController());
    }
  }

  late String result = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Task 1_5'),
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
                          Text('String ${index + 1}'),
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
                          String shortestString = _controller[0].text;
                          for (int i = 0; i < _controller.length; i++) {
                            if (shortestString.length >
                                _controller[i].text.length) {
                              setState(() {
                                shortestString = _controller[i].text;
                                result = _controller[i].text;
                              });
                            }
                          }
                        },
                        child: Text('shortest string in the list: $result')),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
