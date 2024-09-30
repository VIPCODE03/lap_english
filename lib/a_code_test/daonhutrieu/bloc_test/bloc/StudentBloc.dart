
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/Student.dart';

/*  Event */
abstract class StudentEvent {}
class AddStudent extends StudentEvent {
  final Student student;
  AddStudent(this.student);
}

class DeleteStudent extends StudentEvent {
  final Student student;
  DeleteStudent(this.student);
}

class LoadStudent extends StudentEvent {}

/*  State   */
class StudentState {
  final List<Student> students;

  StudentState({required this.students});
}

/*  Bloc  */
class StudentBloc extends Bloc<StudentEvent, StudentState> {
  final studentDB = StudentDB();

  StudentBloc(super.initialState) {
    on<AddStudent>((event, emit) async {
      await studentDB.insert(event.student);
      add(LoadStudent());
    });

    on<LoadStudent>((event, emit) async {
      final students = await studentDB.getData(firstToLast: true);
      emit(StudentState(students: students));
    });

    on<DeleteStudent>((event, emit) async {
      await studentDB.delete(event.student);
      add(LoadStudent());
    });
  }

}