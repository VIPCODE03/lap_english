import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'data/models/Student.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int a = 1;
  int current = 1;

  late StudentDB _studentDB;

  late List<Student> _students = [];

  @override
  void initState() {
    super.initState();
    _studentDB = StudentDB();
    _loadStudent();
  }

  Future<void> _loadStudent() async {
    final students = await _studentDB.getPageData(index: current, limit: 4, firstToLast: false);
    setState(() {
      _students = students;
    });
  }

  Future<void> _loadStudentWithName(String name) async {
    final students = await _studentDB.timkiemtheoten(name);
    setState(() {
      _students = students;
    });
  }


  Future<void> _insert(Student obj) async {
    await _studentDB.insert(obj);
  }

  Future<void> _update(Student oldObj, Student newObj) async {
    bool updated = await _studentDB.update(oldObj, newObj);
    if(!updated) {
      Fluttertoast.showToast(
        msg: "Cập nhật thất bại, vui lòng kiểm tra giá trị hoặc thử lại",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
      );
    }
  }

  Future<void> _delete() async {
    await _studentDB.xoa();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      body: Center(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (query) {
                      setState(() {
                        _loadStudentWithName(query);
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Tìm kiếm sinh viên',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _students.length,
                    itemBuilder: (context, index) {
                      final student = _students[index];
                      return ListTile(
                        title: Text(student.name),
                        subtitle: Text('${student.age}'),
                        trailing: Text(student.class_),
                        onLongPress: () {
                          setState(() {
                            a++;
                            _update(student, Student(student.name, student.age + 1, student.class_));
                            _loadStudent();
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),

            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: TextButton(
                  onPressed: () {
                    if (current != 1) {
                      setState(() {
                        current--;
                        _loadStudent();
                      });
                    }
                  },
                  child: const Text('Trước'),
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      _delete();
                      current = 1;
                      _loadStudent();
                    });
                  },
                  child: const Text('Xóa'),
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      current++;
                      _loadStudent();
                    });
                  },
                  child: const Text('Tiếp'),
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(100.0),
                child: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      a++;
                      _insert(Student('ngu$a', 1, 'K87'));
                      _loadStudent();
                    });
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}