import 'package:flutter/material.dart';

class Task3_6 extends StatefulWidget {
  const Task3_6({super.key});

  @override
  State<Task3_6> createState() => _Task3_6State();
}

class _Task3_6State extends State<Task3_6> {
  TextEditingController list1Controller = TextEditingController();
  TextEditingController list2Controller = TextEditingController();
  List<int> numbers1 = [];
  List<int> numbers2 = [];
  List<int> combineList = [];
  late String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Task 3_6'),
        ),
        body: Column(
          children: [
            TextFormField(
              controller: list1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'list numbers 1',
                  hintText: 'nhập các số cách nhau bởi dấu ,'),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: list2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'list numbers 2',
                  hintText: 'nhập các số cách nhau bởi dấu ,'),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    numbers1 = list1Controller.text
                        .split(',')
                        .map((e) => int.parse(e))
                        .toList();
                    numbers2 = list2Controller.text
                        .split(',')
                        .map((e) => int.parse(e))
                        .toList();
                    combineList = List<int>.from((numbers1)..addAll(numbers2))
                        .toSet()
                        .toList();

                    print(combineList);
                    //sap xep tang dan
                    combineList.sort();
                    //so trung vi
                    for (int i = 0; i <= combineList.length; i++) {
                      if (combineList.length % 2 == 0) {
                        int a = combineList
                            .elementAt((combineList.length / 2 - 1) as int);
                        int b = combineList
                            .elementAt((combineList.length / 2) as int);
                        setState(() {
                          result = ((a + b) / 2).toString();
                        });
                      } else {
                        int c = combineList
                            .elementAt((combineList.length - 1) / 2 as int);
                        setState(() {
                          result = c.toString();
                        });
                      }
                    }
                  },
                  child: const Text('submit'),
                ),
              ),
            ),
            Text('the median of the $combineList : $result')
          ],
        ));
  }
}
