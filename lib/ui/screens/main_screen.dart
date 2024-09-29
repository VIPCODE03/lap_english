import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

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
            selectedItemColor: Colors.green,
            unselectedItemColor: const Color(0xB3EA1111),
            currentIndex: state,
            onTap: (index) {
              context.read<BottomNavCubit>().updateIndex(index);
            },
            items: const [
              //NAV HOME  ----------------------------------------------------------
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),

              //NAV PROFILE --------------------------------------------------------
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),

              //NAV SETTINGS  ------------------------------------------------------
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

class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(0);

  void updateIndex(int index) {
    emit(index);
  }
}
