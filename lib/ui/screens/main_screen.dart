import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => BottomNavCubit(),
        child: Scaffold(
          body: BlocBuilder<BottomNavCubit, int>(
            builder: (context, state) {
              return Screens.screens[state]; //-> Chuyển màn hình nav
            },
          ),
          bottomNavigationBar: BlocBuilder<BottomNavCubit, int>(
            builder: (context, state) {
              return BottomNavigationBar(
                unselectedItemColor: Colors.grey,
                selectedItemColor: Theme.of(context).primaryColor,
                currentIndex: state,
                onTap: (index) {
                  context.read<BottomNavCubit>().updateIndex(index);
                },
                items: const [
                  ///NAV HOME  ----------------------------------------------------------
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: '',
                  ),

                  ///NAV PROFILE --------------------------------------------------------
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: '',
                  ),

                  ///NAV TASK --------------------------------------------------------
                  BottomNavigationBarItem(
                    icon: Icon(Icons.add_chart_outlined),
                    label: '',
                  ),

                  ///NAV SETTINGS  ------------------------------------------------------
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: '',
                  ),
                ],
              );
            },
          ),
        ),
    );
  }
}

/*  BLOC NAV  */
class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(0);

  void updateIndex(int index) {
    emit(index);
  }
}
