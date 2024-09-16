
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_english/a_code_test/daonhutrieu/bloc_test/bloc/StudentBloc.dart';
import 'package:lap_english/a_code_test/daonhutrieu/bloc_test/ui/screens/StudentScreen.dart';

import 'bloc_test/bloc/CounterBloc.dart';
import 'bloc_test/ui/screens/CounterScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => StudentBloc(StudentState(students: [])),
        child: StudentScreen(),
      ),
    );
  }
}