import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Student.dart';

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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Danh sách: ${_students.length}'),
                Expanded(
                  child: ListView.builder(
                    itemCount: _students.length,
                    itemBuilder: (context, index) {
                      final student = _students[index];
                      return ListTile(
                          title: Text(student.name),
                          subtitle: Text('${student.age}'),
                          trailing: Text(student.class_),
                          onLongPress: () => {
                            a++,
                            _update(student, Student(student.name, student.age + 1, student.class_)),
                            _loadStudent()
                          }
                      );
                    },
                  ),
                ),
              ],
            ),

            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: TextButton(
                  onPressed: () { if(current != 1) current--; _loadStudent(); },
                  child: const Text('Trước'),
                ),
              ),
            ),

            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: TextButton(
                  onPressed: () { _delete(); current = 1; _loadStudent(); },
                  child: const Text('Xóa'),
                ),
              ),
            ),

            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: TextButton(
                  onPressed: () {
                    current++;
                    _loadStudent();
                    },
                  child: const Text('Tiếp'),
                ),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          a++; // Increment `a` first
          _insert(Student('Đào Như Triệu $a', 1, 'K87'));
          setState(() {
            _loadStudent();
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
