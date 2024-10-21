import 'package:flutter/material.dart';
import 'package:lap_english/ui/widgets/profile_widgets/row1_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child:
      ListView(
      children: const [
        ///ROW1  --------------------------------------------------------------
        SizedBox(
          height: 300,
          child: WdgRow1Profile(),
        ),

        // ///ROW2  ------------------------- -------------------------------------
        // SizedBox(
        //     height: 260,
        //     child: WdgRow2()
        // ),
        //
        // ///ROW3  --------------------------------------------------------------
        // const SizedBox(
        //     height: 250,
        //     child: WdgRow3(data: ["Chủ đề tiếng anh", "Chủ đề tiếng em", "Chủ đề tiếng Trung", "Chủ đề địt nhau", "Chủ đề bú lồn"],)
        // ),
        //
        // ///ROW4  --------------------------------------------------------------
        // const SizedBox(
        //     height: 250,
        //     child: WdgRow4(data: ["Phổ biến", "Thường ngày", "Khen ngợi ai đó"],)
        // ),
        //
        // ///ROW5  --------------------------------------------------------------
        // Container(
        //   height: 150,
        //   color: Colors.purple,
        //   child: const Center(child: Text('View 5', style: TextStyle(color: Colors.white, fontSize: 20))),
        // ),
      ],
      )
    );
  }
}
