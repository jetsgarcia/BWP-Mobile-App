import 'package:bwp/screens/app/admin/home/admin_home.dart';
import 'package:bwp/screens/app/user/1home/user_home.dart';
import 'package:flutter/material.dart';

class InnerWrapper extends StatelessWidget {
  const InnerWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    if ("User" == "User") {
      return const UserHome();
    } else {
      return const AdminHome();
    }
  }
}
