
import 'package:flutter/material.dart';

import '../../model/Student.dart';

class StudentListWidget extends StatelessWidget {
  final List<Student> students;
  final Function(Student) onDelete;

  const StudentListWidget({
    required this.students,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index) {
        final student = students[index];
        return ListTile(
          title: Text(student.msv.toString()),
          subtitle: Text(student.age.toString()),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => onDelete(student),
          ),
        );
      },
    );
  }
}
