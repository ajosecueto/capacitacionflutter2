import 'dart:convert';

import 'package:capacitacionflutter2/models/Profile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Profile _profile;
  bool exists = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    exists = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _profile != null
            ? Container(
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(_profile.photo),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(_profile.phone.toString())
                  ],
                ),
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }

  void _getData() async {
    await Future.delayed(Duration(seconds: 2));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (exists != null) {
      setState(() {
        _profile = Profile.fromJson(json.decode(prefs.getString("profile")));
      });
    }
  }
}
