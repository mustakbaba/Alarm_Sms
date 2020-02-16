import 'package:alarm_sms/SetAlarmPage.dart';

import 'package:flutter/material.dart';

import 'package:alarm_sms/AccessContacts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Code Snippets',
      theme: new ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0xFF0A0E21)),
      initialRoute: AccessContacts.id,
      routes: {
        AccessContacts.id: (context) => AccessContacts(),
        SetAlarmPage.id: (context) => SetAlarmPage(),
      },
    );
  }
}
