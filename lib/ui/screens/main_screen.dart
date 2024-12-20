import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';
import 'package:lap_english/ui/screens/nav_screens/home_screen.dart';
import 'package:lap_english/ui/screens/nav_screens/profile_screen.dart';
import 'package:lap_english/ui/screens/nav_screens/settings_screen.dart';
import 'package:lap_english/ui/screens/nav_screens/task_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _NavController(),
        child: Scaffold(
          body: BlocBuilder<_NavController, int>(
            builder: (context, state) {
              switch (state) {
                case 0:
                  return const HomeScreen();
                case 1:
                  return const ProfileScreen();
                case 2:
                  return const TaskScreen();
                case 3:
                  return const NavSettings();
                default:
                  return const HomeScreen();
              }
            },
          ),
          bottomNavigationBar: BlocBuilder<_NavController, int>(
            builder: (context, state) {
              return BottomNavigationBar(
                unselectedItemColor: VipColors.onPrimary(context),
                selectedItemColor: VipColors.primary(context),
                currentIndex: state,
                onTap: (index) {
                  context.read<_NavController>().updateIndex(index); //-> Lấy vị trí hiện tại
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
                    icon: Icon(Icons.task),
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
class _NavController extends Cubit<int> {
  _NavController() : super(0);

  void updateIndex(int index) {
    emit(index);
  }
}
