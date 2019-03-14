//import 'package:flutter/material.dart';
//import 'auth.dart';
//
//class UserProfile extends StatefulWidget {
//  @override
//  UserProfileState createState() => UserProfileState();
//}
//
//class UserProfileState extends State<UserProfile> {
//  Map<String, dynamic> _profile;
//  bool _loading = false;
//
//  @override
//  void initState() {
//    super.initState();
//    authService.profile.listen((state) => setState(() => _profile = state));
//
//    authService.loading.listen((state) => setState(() => _loading = state));
//  }
//
//  @override
//  Widget build(BuildContext)
//  {
//    return Column(
//      children: <Widget>[
//        Container(
//          padding: EdgeInsets.all(20),
//          child: Text(_profile.toString())
//        )
//      ],
//    );
//  }
//}