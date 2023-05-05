import 'package:flutter/material.dart';
import 'package:my_project/level_1/task1_1.dart';
import 'package:my_project/level_1/task1_10.dart';
import 'package:my_project/level_1/task1_2.dart';
import 'package:my_project/level_1/task1_3.dart';
import 'package:my_project/level_1/task1_4.dart';
import 'package:my_project/level_1/task1_6.dart';
import 'package:my_project/level_1/task1_7.dart';
import 'package:my_project/level_1/task1_8.dart';
import 'package:my_project/level_1/task1_9.dart';
import 'package:my_project/level_2/task2_1.dart';
import 'package:my_project/level_2/task2_2.dart';
import 'package:my_project/level_2/task2_3.dart';
import 'package:my_project/level_2/task2_4.dart';
import 'package:my_project/level_2/task2_5.dart';
import 'package:my_project/level_3/task3_10.dart';
import 'package:my_project/level_3/task3_2.dart';
import 'package:my_project/level_3/task3_3.dart';
import 'package:my_project/level_3/task3_4.dart';
import 'package:my_project/level_3/task3_5.dart';
import 'package:my_project/level_3/task3_6.dart';
import 'package:my_project/level_3/task3_7.dart';

import 'level_1/task1_5.dart';
import 'level_3/task3_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> listTaskLevel1 = [
    const Task1_1(),
    const Task1_2(),
    const Task1_3(),
    const Task1_4(),
    const Task1_5(),
    const Task1_6(),
    const Task1_7(),
    const Task1_8(),
    const Task1_9(),
    const Task1_10(),
  ];
  List<Widget> listTaskLevel2 = [
    const Task2_1(),
    const Task2_2(),
    const Task2_3(),
    const Task2_4(),
    const Task2_5(),
  ];
  List<Widget> listTaskLevel3 = [
    const Task3_1(),
    const Task3_2(),
    const Task3_3(),
    const Task3_4(),
    const Task3_5(),
    const Task3_6(),
    const Task3_7(),
    const Task3_10(),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('MY PROJECT'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Level 1',
              ),
              Tab(
                text: 'Level 2',
              ),
              Tab(
                text: 'Level 3',
              ),
              Tab(
                text: 'Level 4',
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          _level_1(),
          _level_2(),
          _level_3(),
          _level_1(),
        ]),
      ),
    );
  }

  Widget _level_1() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: listTaskLevel1.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => listTaskLevel1[index],
                  ));
            },
            child: Text('Task 1_${index + 1}'),
          ),
        );
      },
    );
  }

  Widget _level_2() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: listTaskLevel2.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => listTaskLevel2[index],
                  ));
            },
            child: Text('Task 2_${index + 1}'),
          ),
        );
      },
    );
  }

  Widget _level_3() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: listTaskLevel3.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => listTaskLevel3[index],
                  ));
            },
            child: Text('Task 3_${index + 1}'),
          ),
        );
      },
    );
  }
}
