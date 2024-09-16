import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_english/a_code_test/daonhutrieu/bloc_test/bloc/StudentBloc.dart';

import '../../model/Student.dart';

class StudentScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final noteBloc = BlocProvider.of<StudentBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Student App with BLoC and SQLite'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: contentController,
              decoration: InputDecoration(labelText: 'Content'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final student = Student(
                0,
                titleController.text,
                int.parse(contentController.text)
              );
              noteBloc.add(AddStudent(student));
            },
            child: Text('Add Note'),
          ),
          Expanded(
            child: BlocBuilder<StudentBloc, StudentState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.students.length,
                  itemBuilder: (context, index) {
                    final student = state.students[index];
                    return ListTile(
                      title: Text(student.name),
                      subtitle: Text(student.age.toString()),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          noteBloc.add(DeleteStudent(student));
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}