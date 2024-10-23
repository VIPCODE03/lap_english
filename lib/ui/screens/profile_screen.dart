import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lap_english/a_data_test/data_user_test.dart';
import 'package:lap_english/data/model/user/user.dart';

import '../widgets/nav_profile_widgets/row1_profile.dart';
import '../widgets/nav_profile_widgets/row2_profile.dart';
import '../widgets/nav_profile_widgets/row3_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  late Map<String, dynamic> userMap;
  late User user;

  @override
  void initState() {
    super.initState();

    //---   Khởi tạo user   ---
    userMap = jsonDecode(UserDataTest.getUserJson());
    user = User.fromJson(userMap);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        /// ROW1  --------------------------------------------------------------
        SizedBox(
          child: WdgRow1Profile(user: user),
        ),
        _space(),

        /// ROW2  --------------------------------------------------------------
        SizedBox(
          height: 170,
          child: WdgRow2Profile(skill: user.skills),
        ),
        _space(),

        /// ROW3  --------------------------------------------------------------
        SizedBox(
          height: 200,
          child: WdgRow3Profile(user: user),
        ),
        _space(),

      ],
    );
  }

  Widget _space() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      height: 0.5,
      color: Theme.of(context).primaryColor,
    );
  }
}
