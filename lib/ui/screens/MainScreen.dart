import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_english/ui/screens/Screens.dart';

void main() {
  runApp(MyApp());
}

// Bloc quản lý trạng thái của bottom navigation
class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(0);

  void updateIndex(int index) {
    emit(index);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => BottomNavCubit(),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BottomNavCubit, int>(
        builder: (context, state) {
          return Screens.screens[state];
        },
      ),
      bottomNavigationBar: BlocBuilder<BottomNavCubit, int>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: state,
            onTap: (index) {
              context.read<BottomNavCubit>().updateIndex(index);
            },
            items: const [
              //HOME  ----------------------------------------------------------
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),

              //PROFILE --------------------------------------------------------
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),

              //SETTINGS  ------------------------------------------------------
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),

            ],
          );
        },
      ),
    );
  }
}
